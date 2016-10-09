require 'json'

class JsonParser
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def parsed_data
    JSON.parse(payload)
  end

end
