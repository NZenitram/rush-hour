require_relative '../spec_helper'

RSpec.describe "Client" do
  describe "validation" do
    it "is invalid without an identifier" do
      client = Client.find_or_create_by(root_url: "test")

      expect(client).to_not be_valid
    end

    it "is invalid without a rootUrl" do
      client = Client.find_or_create_by(identifier: "test")

      expect(client).to_not be_valid
    end
  end

  describe "method verification" do
    it "returns an average response time" do
      client = Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")

      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 100,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client.id
                    )
      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client.id
                    )

      expect(client.average_response_time).to eq(50)
    end

    it "returns a max response time" do
      client = Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")

      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 100,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client.id
                    )
      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client.id
                    )

      expect(client.max_response_time).to eq(100)
    end

    it "returns an min response time" do
      client = Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")

      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 100,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client.id
                    )
      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client.id
                    )

      expect(client.min_response_time).to eq(25)
    end

    it "returns the most frequent request type" do
      client1 = Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")
      client2 = Client.create(identifier: "jumpstartlab1", root_url: "http://jumpstartlabs.com")

      r1 = RequestType.find_or_create_by(http_verb: "GET")
      r2 = RequestType.find_or_create_by(http_verb: "POST")

      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 100,
                     referred_by_id: 1,
                     request_type_id: r1.id,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: r1.id,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: r2.id,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: r2.id,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client2.id
                    )


      expect(client1.most_frequent_request_type).to eq("GET")
      expect(client2.most_frequent_request_type).to eq("POST")
    end





  end
end
