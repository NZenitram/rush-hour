require 'json'
require 'user_agent'
require 'pry'

class DataLoader
  attr_reader :payload, :payload_data, :client_name, :user_agent

  def initialize(params)
    @payload = JSON.parse(params["payload"])
    @client_name = params["IDENTIFIER"]
    @user_agent = UserAgent.parse(payload["userAgent"])
  end

  def load_payload
    Payload.create(url: Url.find_or_create_by(address: payload["url"]),
                   requested_at: payload["requestedAt"],
                   responded_in: payload["respondedIn"],
                   referred_by: ReferredBy.find_or_create_by(address: payload["referredBy"]),
                   request_type: RequestType.find_or_create_by(http_verb: payload["requestType"]),
                   event: Event.find_or_create_by(name: payload["eventName"]),
                   u_agent: UAgent.find_or_create_by(browser: user_agent.browser, operating_system: user_agent.platform),
                   resolution: Resolution.find_or_create_by(height: payload["resolutionHeight"], width: payload["resolutionWidth"]),
                   ip: Ip.find_or_create_by(address: payload["ip"]),
                   client: Client.find_by(identifier: client_name)
                  )
  end

  def search_payload
    Payload.find_by(url: Url.find_by(address: payload["url"]),
                   requested_at: payload["requestedAt"].to_datetime,
                   responded_in: payload["respondedIn"],
                   referred_by: ReferredBy.find_by(address: payload["referredBy"]),
                   request_type: RequestType.find_by(http_verb: payload["requestType"]),
                   event: Event.find_by(name: payload["eventName"]),
                   u_agent: UAgent.find_by(browser: user_agent.browser, operating_system: user_agent.platform),
                   resolution: Resolution.find_by(height: payload["resolutionHeight"], width: payload["resolutionWidth"]),
                   ip: Ip.find_by(address: payload["ip"]),
                   client: Client.find_by(identifier: client_name)
                  )
  end

end
