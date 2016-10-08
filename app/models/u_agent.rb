class UAgent < ActiveRecord::Base
  validates :browser, presence: true
  validates :operating_system, presence: true
  has_many :payloads

  def web_browser_breakdown
    browsers = group(:browser).count
  end
end
