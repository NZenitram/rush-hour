require_relative 'controller_helper'

class ResponseIdentifier <Sinatra::Base

  def self.source_response(params)
    if ControllerHelper.valid_parameters(params)
      [400, "Please ensure all parameters are provided\n"]
    elsif ControllerHelper.client_exists(params)
      [403, "Please create a unique Identifier\n"]
    else
      ControllerHelper.create_client(params)
      [200, "{'identifier':'#{params[:identifier]}'}\n"]
    end
  end

  def self.identifier_data_response(params)
    if ControllerHelper.nil_client(params)
      [403, "Please ensure the client exists\n"]
    elsif ControllerHelper.nil_params(params)
      [403, "Please ensure a payload is included in the data submission\n"]
    elsif ControllerHelper.payload_exists(params)
      [403, "Please ensure payload data is unique\n"]
    else
      ControllerHelper.create_payload(params)
      [200, "Payload created\n"]
    end
  end

  def self.identifier_response(params)
    if ControllerHelper.nil_client(params)
      [403, "Please ensure the client exists\n", :error]
    elsif ControllerHelper.payloads_associated(params)
      [403, "No payloads have been received for this source\n", :error]
    else
      [200, "Everything OK", :identifier]
    end
  end

  def self.url_response(params, url)
    if url.nil?
      ["This URL has not been requested", :error]
    else
      ["Everything OK", :url_info]
    end

  end



end
