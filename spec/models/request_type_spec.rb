require_relative '../spec_helper'

RSpec.describe "Request_type" do

  describe "validation" do
    it "is invalid without an http_verb" do
      request_type = RequestType.new()

      expect(request_type).to_not be_valid
    end

    it "is invalid if verb is a duplicate" do
      request_type1 = RequestType.create(http_verb: "GET")
      request_type2 = RequestType.new(http_verb: "GET")

      expect(request_type2).to_not be_valid
    end
  end

  describe "returns http verbs" do
    it "returns most frequently used http verb" do
      r1 = RequestType.find_or_create_by(http_verb: "GET")
      r2 = RequestType.find_or_create_by(http_verb: "POST")

      payload = Payload.create(
                               url_id: 1,
                               requested_at: "2013-02-16 21:38:28 -0700",
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: r1.id,
                               event_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )
      payload = Payload.create(
                               url_id: 1,
                               requested_at: "2013-02-16 21:38:28 -0700",
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: r1.id,
                               event_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )
      payload = Payload.create(
                               url_id: 1,
                               requested_at: "2013-02-16 21:38:28 -0700",
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: r2.id,
                               event_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )



      expect(RequestType.most_frequent).to eq("GET")
      expect(RequestType.most_frequent).to_not eq("POST")

    end

    it "returns most frequently used http verb" do
      r1 = RequestType.find_or_create_by(http_verb: "GET")
      r2 = RequestType.find_or_create_by(http_verb: "POST")
      r3 = RequestType.find_or_create_by(http_verb: "DELETE")

      payload = Payload.create(
                               url_id: 1,
                               requested_at: "2013-02-16 21:38:28 -0700",
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: r1.id,
                               event_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )
      payload = Payload.create(
                               url_id: 1,
                               requested_at: "2013-02-16 21:38:28 -0700",
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: r1.id,
                               event_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )
      payload = Payload.create(
                               url_id: 1,
                               requested_at: "2013-02-16 21:38:28 -0700",
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: r2.id,
                               event_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )

      payload = Payload.create(
                               url_id: 1,
                               requested_at: "2013-02-16 21:38:28 -0700",
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: r2.id,
                               event_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )
      payload = Payload.create(
                               url_id: 1,
                               requested_at: "2013-02-16 21:38:28 -0700",
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: r3.id,
                               event_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )



      expect(RequestType.verbs_list).to_not eq(["GET", "POST"])
      expect(RequestType.verbs_list.sort).to eq(["DELETE", "GET", "POST"])

    end
  end

end
