require_relative 'client'

class ControllerHelper 

  def self.valid_parameters(params)
    params[:identifier].nil? || params[:identifier] == "" ||
    params[:rootUrl].nil?    || params[:rootUrl] == ""
  end

  def self.client_exists(params)
    Client.exists?(identifier: params[:identifier])
  end

  def self.create_client(params)
    Client.find_or_create_by(
                             identifier: params[:identifier],
                             root_url: params[:rootUrl]
                            )
  end

  def self.find_client(params)
    Client.find_by(identifier: params[:IDENTIFIER])
  end

  def self.nil_client(params)
    find_client(params).nil?
  end

  def self.nil_params(params)
    params[:payload].nil?
  end

  def self.payload_exists(params)
    Payload.exists?(DataLoader.new(params).search_payload)
  end

  def self.create_payload(params)
    DataLoader.new(params).load_payload
  end

  def self.payloads_associated(params)
    find_client(params).payloads.count == 0
  end

  def self.find_url(client, params)
    Url.find_by(address: client.root_url+"/"+params[:RELATIVEPATH])
  end

end
