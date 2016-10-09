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
            body "Missing parameters\n"
      elsif Client.exists?(identifier: params[:identifier])
        status 403
        body "Identifier Already Exists\n"
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
      binding.pry
      if Client.find_by(identifier: params[:IDENTIFIER]).nil?
        status 400
        body "Client does not exist\n"
      end
    end

  end
end
