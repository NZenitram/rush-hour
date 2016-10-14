class Ip < ActiveRecord::Base
  validates :address, presence: true
  validates :address, uniqueness: true

  has_many :payloads
end
