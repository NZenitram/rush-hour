module RushHour
  class Server < Sinatra::Base
    set :show_exceptions, :after_handler

    not_found do
      erb :error
    end

    post '/sources' do
      if  ( params[:identifier].nil? || params[:identifier] == "" ||
            params[:rootUrl].nil?    || params[:rootUrl] == ""
            )
            status 400
            body "Please ensure all parameters are provided\n"
      elsif Client.exists?(identifier: params[:identifier])
        status 403
        body "Please create a unique Identifier\n"
       else
          Client.find_or_create_by(
              identifier: params[:identifier],
              root_url: params[:rootUrl]
              )
          status 200
          body "{'identifier':'#{params[:identifier]}'}\n"
      end
    end

    post '/sources/:IDENTIFIER/data' do
      if Client.find_by(identifier: params[:IDENTIFIER]).nil?
        status 403
        body "Please ensure the client exists\n"
      elsif params[:payload].nil?
        status 403
        body "Please ensure a payload is included in the data submission\n"
      elsif Payload.exists?(DataLoader.new(params).search_payload)
        status 403
        body "Please ensure payload data is unique\n"
      else
        status 200
        body "All ok\n"
        DataLoader.new(params).load_payload
      end
    end

  end
end
