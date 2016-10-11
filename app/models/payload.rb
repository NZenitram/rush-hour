class Payload < ActiveRecord::Base
  validates :url_id,            presence: true
  validates :requested_at,      presence: true
  validates :responded_in,      presence: true
  validates :referred_by_id,    presence: true
  validates :request_type_id,   presence: true
  validates :event_id,          presence: true
  validates :u_agent_id,        presence: true
  validates :resolution_id,     presence: true
  validates :ip_id,             presence: true

  belongs_to :client
  belongs_to :event
  belongs_to :ip
  belongs_to :referred_by
  belongs_to :request_type
  belongs_to :resolution
  belongs_to :u_agent
  belongs_to :url

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
