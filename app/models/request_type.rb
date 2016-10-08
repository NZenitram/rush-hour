require 'pry'

class RequestType < ActiveRecord::Base
  validates :http_verb, presence: true
  has_many :payloads

  def self.most_frequent
    binding.pry
    group(:http_verb).order("http_verb DESC").count
  end
end
