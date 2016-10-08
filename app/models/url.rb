class Url < ActiveRecord::Base
  validates :address, presence: true
  has_many :payloads

  def self.order_addresses
    result = group(:address).count.sort_by{ |k,v| v}.reverse
    result.map { |address_info| address_info.first }
  end
end
