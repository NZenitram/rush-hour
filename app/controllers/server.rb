module RushHour
  class Server < Sinatra::Base
    set :show_exceptions, :after_handler

    not_found do
      erb :error
    end

    post '/sources' do
      if ControllerLogic.valid_parameters(params)
        status 400
        body "Please ensure all parameters are provided\n"
      elsif ControllerLogic.client_exists(params)
        status 403
        body "Please create a unique Identifier\n"
      else
        ControllerLogic.create_client(params)
        status 200
        body "{'identifier':'#{params[:identifier]}'}\n"
      end

    end

    post '/sources/:IDENTIFIER/data' do
      if ControllerLogic.nil_client(params)
        status 403
        body "Please ensure the client exists\n"
      elsif ControllerLogic.nil_params(params)
        status 403
        body "Please ensure a payload is included in the data submission\n"
      elsif ControllerLogic.payload_exists(params)
        status 403
        body "Please ensure payload data is unique\n"
      else
        ControllerLogic.create_payload(params)
        status 200
        body "Payload created\n"
      end
    end

    get '/sources/:IDENTIFIER' do
      if ControllerLogic.nil_client(params)
        status 403
        body "Please ensure the client exists\n"
        erb :error
      elsif ControllerLogic.payloads_associated(params)
        status 403
        body "No payloads have been received for this source\n"
        erb :error
      else
        erb :urls
      end
    end

    get '/sources/:IDENTIFIER/urls/:RELATIVEPATH' do
      erb :url_info
    end

  end
end
