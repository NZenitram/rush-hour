require 'json'

class DataLoader
  attr_reader :payload

  def initialize(payload)
    @payload = JSON.parse(payload)
  end

end
