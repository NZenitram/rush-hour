class RequestType < ActiveRecord::Base
  validates :http_verb, presence: true
  has_many :payloads

  def self.most_frequent
    request_types = Payload.all.group(:request_type_id).count
    request_type = request_types.sort_by{ |k, v| v}.last
    RequestType.find(request_type[0]).http_verb
  end

  def self.verbs_list
    request_types = Payload.all.group(:request_type_id).count
    request_types_sort = request_types.sort_by{ |k, v| v}
    thing = request_types_sort.map do |element|
      RequestType.find(element[0]).http_verb
    end
  end


  # def self.where_payload(requested_verb)
  #   Payload.where(request_type_id: find_request_type(requested_verb))
  # end
  #
  # def self.find_request_type(requested_verb)
  #   find_by(http_verb: requested_verb.to_s)
  # end

end
