class Client < ActiveRecord::Base
  validates :identifier, presence: true
  validates :root_url, presence: true
  validates :identifier, uniqueness: true

  has_many :payloads
  has_many :events,
    through: :payloads
  has_many :ips,
    through: :payloads
  has_many :referred_bies,
    through: :payloads
  has_many :request_types,
    through: :payloads
  has_many :resolutions,
    through: :payloads
  has_many :u_agents,
    through: :payloads
  has_many :urls,
    through: :payloads

  def average_response_time
    payloads.average_response.to_i
  end

  def max_response_time
    payloads.max_response
  end

  def min_response_time
    payloads.min_response
  end

  def most_frequent_request_type
    request_types.most_frequent(payloads)
  end

  def client_verbs_list
    request_types.verbs_list(payloads)
  end

  def list_of_sorted_urls
    urls.order_addresses
  end

  def web_browsers_across_payloads
    u_agents.web_browser_breakdown
  end

  def operating_systems_across_payloads
    u_agents.operating_system_breakdown
  end

  def resolutions_across_payloads
    resolutions.resolution_occurances
  end

  def event_response_time_count(params)
    events.where(name: params[:EVENTNAME]).group("DATE_PART('hour', requested_at)").count
  end

end
