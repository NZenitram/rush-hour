module RushHour
  class Server < Sinatra::Base
    set :show_exceptions, :after_handler

    not_found do
      erb :error
    end

    post '/sources' do
      ValidateParams.source_response(params)
    end

    post '/sources/:IDENTIFIER/data' do
      ValidateParams.identifier_data_response(params)
    end

    get '/sources/:IDENTIFIER' do
      @client = ControllerLogic.find_client(params)
      response = ValidateParams.identifier_response(params)
      status  response[0]
      body    response[1]
      erb     response[-1]
    end

    get '/sources/:IDENTIFIER/urls/:RELATIVEPATH' do
      @client = ControllerLogic.find_client(params)
      @url = ControllerLogic.find_url(@client, params)
      response = ValidateParams.url_response(params, @url)
      body  response[0]
      erb   response[-1]
    end

    get '/sources/:IDENTIFIER/events/:EVENTNAME' do
      @client = ControllerLogic.find_client(params)
      @occurances = @client.event_response_time_count(params)
      @event = params[:EVENTNAME]
      erb :events
    end
  end
end
