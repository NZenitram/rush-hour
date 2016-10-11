class Client < ActiveRecord::Base
  validates :identifier, presence: true
  validates :root_url, presence: true

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
    binding.pry
    payloads.request_type.most_frequent
  end



end
