class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :payloads

end
