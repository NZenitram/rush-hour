require 'pry'
class UAgent < ActiveRecord::Base
  validates :browser, presence: true
  validates :operating_system, presence: true

  has_many :payloads

  def self.web_browser_breakdown
    browsers = group(:browser).count
    total = UAgent.count
    browsers.each do |browser, occurance_total|
        browsers[browser] = (occurance_total.to_f/total).round(3)
    end
  end

  def self.operating_system_breakdown
    operating_systems = group(:operating_system).count
    total = UAgent.count
    operating_systems.each do |os, occurance_total|
        operating_systems[os] = (occurance_total.to_f/total).round(3)
    end
  end

end
