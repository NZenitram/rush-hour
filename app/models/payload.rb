class Payload < ActiveRecord::Base
  validates :url_id,            presence: true
  validates :requested_at,      presence: true
  validates :responded_in,      presence: true
  validates :referred_by_id,    presence: true
  validates :request_type_id,   presence: true
  validates :event_name_id,     presence: true
  validates :u_agent_id,        presence: true
  validates :resolution_id,     presence: true
  validates :ip_id,             presence: true

  belongs_to :events
  belongs_to :ips
  belongs_to :referred_bies
  belongs_to :request_types
  belongs_to :resolutions
  belongs_to :u_agents
  belongs_to :urls

  def self.average_response
    average(:responded_in)
  end

  def self.max_response
    maximum(:responded_in)
  end

  def self.min_response
    minimum(:responded_in)
  end


end
