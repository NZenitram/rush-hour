require 'pry'

class RequestType < ActiveRecord::Base
  validates :http_verb, presence: true
  has_many :payloads

  def self.most_frequent
    group(:http_verb).count.max_by{ |k, v| v}[0]
  end

  def self.verbs_list
    group(:http_verb).count.keys.sort
  end

end
