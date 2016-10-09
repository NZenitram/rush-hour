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
end
