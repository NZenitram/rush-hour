class ReferredBy < ActiveRecord::Base
  validates :address, presence: true
  has_many :payloads
end
