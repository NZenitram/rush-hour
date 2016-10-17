module RushHour
  class Server < Sinatra::Base
    set :show_exceptions, :after_handler

    not_found do
      erb :error
    end

    post '/sources' do
      ResponseIdentifier.source_response(params)
    end

    post '/sources/:IDENTIFIER/data' do
      ResponseIdentifier.identifier_data_response(params)
    end

    get '/sources/:IDENTIFIER' do
      @client = ControllerHelper.find_client(params)
      response = ResponseIdentifier.identifier_response(params)
      status  response[0]
      body    response[1]
      erb     response[-1]
    end

    get '/sources/:IDENTIFIER/urls/:RELATIVEPATH' do
      @client = ControllerHelper.find_client(params)
      @url = ControllerHelper.find_url(@client, params)
      response = ResponseIdentifier.url_response(params, @url)
      body  response[0]
      erb   response[-1]
    end

    get '/sources/:IDENTIFIER/events/:EVENTNAME' do
      @client = ControllerHelper.find_client(params)
      @occurances = @client.event_response_time_count(params)
      @event = params[:EVENTNAME]
      erb :events
    end
  end
end
