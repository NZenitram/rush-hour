class RequestType < ActiveRecord::Base
  validates :http_verb, presence: true
  validates :http_verb, uniqueness: true
  
  has_many :payloads

  def self.most_frequent(loads = Payload.all)
    request_type = request_types_sort(loads).last
    RequestType.find(request_type[0]).http_verb
  end

  def self.verbs_list(loads = Payload.all)
    request_types_sort(loads).map do |element|
      RequestType.find(element[0]).http_verb
    end
  end

  def self.request_types(loads)
    loads.group(:request_type_id).count
  end

  def self.request_types_sort(loads)
    request_types(loads).sort_by{ |k, v| v}
  end

end
