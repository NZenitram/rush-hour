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

    it "returns ordered url addresses" do
      client1 = Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")
      client2 = Client.create(identifier: "jumpstartlab1", root_url: "http://jumpstartlabs.com")

      url_1 = Url.find_or_create_by(address: "http://jumpstartlabs.com/blog")
      url_2 = Url.find_or_create_by(address: "http://www.google.com")

      Payload.create(
                     url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 100,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client2.id
                    )


      expect(client1.list_of_sorted_urls).to eq(["http://jumpstartlabs.com/blog", "http://www.google.com"])
      expect(client2.list_of_sorted_urls).to eq(["http://www.google.com"])
    end

    it "returns web browsers across payloads" do
      client1 = Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")
      client2 = Client.create(identifier: "jumpstartlab1", root_url: "http://jumpstartlabs.com")

      ua_1 = UAgent.find_or_create_by(browser: "Chrome", operating_system: "Windows 10")
      ua_2 = UAgent.find_or_create_by(browser: "Firefox", operating_system: "Mac OS X")

      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 100,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: ua_1.id,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: ua_1.id,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: ua_2.id,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: ua_2.id,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client2.id
                    )


      expect(client1.web_browsers_across_payloads).to eq({"Chrome" => 0.667, "Firefox" => 0.333})
      expect(client2.web_browsers_across_payloads).to eq({"Firefox" => 1.0})
      expect(client2.web_browsers_across_payloads).to_not eq({"Chrome" => 0.50, "Firefox" => 0.50})
    end

    it "returns operating systems across payloads" do
      client1 = Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")
      client2 = Client.create(identifier: "jumpstartlab1", root_url: "http://jumpstartlabs.com")

      ua_1 = UAgent.find_or_create_by(browser: "Chrome", operating_system: "Windows 10")
      ua_2 = UAgent.find_or_create_by(browser: "Firefox", operating_system: "Mac OS X")

      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 100,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: ua_1.id,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: ua_1.id,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: ua_2.id,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: ua_2.id,
                     resolution_id: 2,
                     ip_id: 1,
                     client_id: client2.id
                    )


      expect(client1.operating_systems_across_payloads).to eq({"Mac OS X" => 0.333, "Windows 10" => 0.667})
      expect(client2.operating_systems_across_payloads).to eq({"Mac OS X" => 1.0})
      expect(client2.operating_systems_across_payloads).to_not eq({"Chrome" => 0.50, "Firefox" => 0.50})
    end

    it "returns operating systems across payloads" do
      client1 = Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")
      client2 = Client.create(identifier: "jumpstartlab1", root_url: "http://jumpstartlabs.com")

      res_1 = Resolution.find_or_create_by(height: "1920", width: "1080")
      res_2 = Resolution.find_or_create_by(height: "1200", width: "900")
      res_3 = Resolution.find_or_create_by(height: "0", width: "0")

      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 100,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: res_1.id,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 2,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: res_1.id,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: res_2.id,
                     ip_id: 1,
                     client_id: client1.id
                    )
      Payload.create(
                     url_id: 1,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: res_3.id,
                     ip_id: 1,
                     client_id: client2.id
                    )


      expect(client1.resolutions_across_payloads).to eq(["1200 x 900", "1920 x 1080"])
      expect(client2.resolutions_across_payloads).to eq(["0 x 0"])
    end

  end
end
