require 'pry'

class Url < ActiveRecord::Base
  validates :address, presence: true
  has_many :payloads

  def self.order_addresses
    result = group(:address).count.sort_by{ |k,v| v}.reverse
    result.map { |address_info| address_info.first }
  end

  def self.max_response_time(requested_address)
    where_payload(requested_address).max_response
  end

  def max_response_time
    payloads.maximum(:responded_in)
  end

  def self.min_response_time(requested_address)
    where_payload(requested_address).min_response
  end

  def self.where_payload(requested_address)
    Payload.where(url_id: find_address(requested_address))
  end

  def self.find_address(requested_address)
    find_by(address: requested_address.to_s)
  end

  def self.list_all_response_times(requested_address)
    where_payload(requested_address).map do |payload|
      payload.responded_in
    end.sort.reverse
  end

  def self.list_all_http_verbs(requested_address)
    where_payload(requested_address).map do |payload|
      payload.request_type.http_verb
    end.uniq
  end

  def self.find_top_referrers(requested_address)
    referred_group = where_payload(requested_address).group(:referred_by_id).count
    referred_group_sort = referred_group.sort_by{ |k,v| v}.reverse.first(3)
    referred_group_sort.map do |element|
      ReferredBy.find(element[0]).address
    end
  end

  def self.find_top_agents(requested_address)
    agent_group = where_payload(requested_address).group(:u_agent_id).count
    agent_group_sort = agent_group.sort_by{ |k,v| v}.reverse.first(3)
    agent_group_sort.map do |element|
      [UAgent.find(element[0]).browser, UAgent.find(element[0]).operating_system]
    end
  end

end
