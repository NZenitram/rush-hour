
class Resolution < ActiveRecord::Base
  validates :height, presence: true
  validates :width, presence: true

  has_many :payloads

  def self.resolution_occurances
    resolutions = group(:height, :width).count
    formatted = resolutions.keys.map do |resolution|
      "#{resolution[0]} x #{resolution[-1]}"
    end
    formatted.sort
  end

end
