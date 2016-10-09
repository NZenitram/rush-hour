class RequestType < ActiveRecord::Base
  validates :http_verb, presence: true
  has_many :payloads

  def self.most_frequent
    request_type = request_types_sort.last
    RequestType.find(request_type[0]).http_verb
  end

  def self.verbs_list
    request_types_sort.map do |element|
      RequestType.find(element[0]).http_verb
    end
  end

  def self.request_types
    Payload.all.group(:request_type_id).count
  end

  def self.request_types_sort
    request_types.sort_by{ |k, v| v}
  end

end
