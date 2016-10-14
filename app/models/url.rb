require 'pry'

class Url < ActiveRecord::Base
  validates :address, presence: true
  validates :address, uniqueness: true

  has_many :payloads

  def self.order_addresses
    result = group(:address).count.sort_by{ |k,v| v}.reverse
    result.map { |address_info| address_info.first }
  end

  def max_response_time
    payloads.maximum(:responded_in)
  end

  def min_response_time
    payloads.minimum(:responded_in)
  end

  def list_all_response_times
    payloads.map do |payload|
      payload.responded_in
    end.sort.reverse
  end

  def list_all_http_verbs
    payloads.map do |payload|
      payload.request_type.http_verb
    end.uniq
  end

  def find_top_referrers
    referred_group = payloads.group(:referred_by_id).count
    referred_group_sort = referred_group.sort_by{ |k,v| v}.reverse.first(3)
    referred_group_sort.map do |element|
      ReferredBy.find(element[0]).address
    end
  end

  def find_top_agents
    agent_group = payloads.group(:u_agent_id).count
    agent_group_sort = agent_group.sort_by{ |k,v| v}.reverse.first(3)
    agent_group_sort.map do |element|
      [UAgent.find(element[0]).browser, UAgent.find(element[0]).operating_system]
    end.sort
  end

end
