require_relative '../spec_helper'

RSpec.describe "Url" do

  describe "validation" do
    it "is invalid without an address" do
      url = Url.new()

      expect(url).to_not be_valid
    end
  end

  describe "order URL" do
    it "orders URLS from most requested to least requested" do
      Url.create(address: "http://www.google.com")
      Url.create(address: "http://www.google.com")
      Url.create(address: "http://www.github.com")
      Url.create(address: "http://www.github.com")
      Url.create(address: "http://www.reddit.com")
      Url.create(address: "http://www.reddit.com")
      Url.create(address: "http://www.reddit.com")


      expect(Url.order_addresses).to_not eq(["http://www.google.com",
                                             "http://www.github.com"
                                          ])
      expect(Url.order_addresses).to eq(["http://www.reddit.com",
                                         "http://www.google.com",
                                         "http://www.github.com"
                                       ])
    end
  end

  describe "information on specific URLS" do
    it "can retrieve maximum response time from a URL" do
      url_1 = Url.find_or_create_by(address: "http://www.google.com")
      url_2 = Url.find_or_create_by(address: "http://www.google.com")
      url_3 = Url.find_or_create_by(address: "http://www.github.com")
      url_4 = Url.find_or_create_by(address: "http://www.reddit.com")

      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_3.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_4.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )

      expect(Url.max_response_time("http://www.google.com")).to eq(35)
      expect(Url.max_response_time("http://www.github.com")).to eq(45)
      expect(Url.max_response_time("http://www.reddit.com")).to eq(55)
    end

    it "can retrieve minimimum response time from a URL" do
      url_1 = Url.find_or_create_by(address: "http://www.google.com")
      url_2 = Url.find_or_create_by(address: "http://www.google.com")
      url_3 = Url.find_or_create_by(address: "http://www.github.com")
      url_4 = Url.find_or_create_by(address: "http://www.reddit.com")

      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_3.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_4.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )

      expect(Url.min_response_time("http://www.google.com")).to eq(25)
      expect(Url.min_response_time("http://www.github.com")).to eq(45)
      expect(Url.min_response_time("http://www.reddit.com")).to eq(55)
    end

    it "can retrieve all response times from a URL" do
      url_1 = Url.find_or_create_by(address: "http://www.google.com")
      url_2 = Url.find_or_create_by(address: "http://www.google.com")
      url_3 = Url.find_or_create_by(address: "http://www.google.com")
      url_4 = Url.find_or_create_by(address: "http://www.reddit.com")

      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_3.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_4.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )

      expect(Url.list_all_response_times("http://www.google.com")).to eq([45, 35, 25])
      expect(Url.list_all_response_times("http://www.reddit.com")).to eq([55])
    end

    it "can retrieve HTTP verbs" do
      url_1 = Url.find_or_create_by(address: "http://www.google.com")
      url_2 = Url.find_or_create_by(address: "http://www.reddit.com")
      type_1 = RequestType.find_or_create_by(http_verb: "GET")
      type_2 = RequestType.find_or_create_by(http_verb: "POST")
      type_3 = RequestType.find_or_create_by(http_verb: "DELETE")
      type_4 = RequestType.find_or_create_by(http_verb: "GET")

      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: type_1.id,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: 1,
                     request_type_id: type_2.id,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: 1,
                     request_type_id: type_3.id,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: type_4.id,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: type_1.id,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )

      expect(Url.list_all_http_verbs("http://www.google.com")).to eq(["GET", "POST", "DELETE"])
      expect(Url.list_all_http_verbs("http://www.reddit.com")).to eq(["GET"])
    end

    it "can retrieve referrers" do
      url_1 = Url.find_or_create_by(address: "http://www.facebook.com")
      ref_1 = ReferredBy.find_or_create_by(address: "http://www.google.com")
      ref_2 = ReferredBy.find_or_create_by(address: "http://www.reddit.com")
      ref_3 = ReferredBy.find_or_create_by(address: "http://www.github.com")
      ref_4 = ReferredBy.find_or_create_by(address: "http://www.yahoo.com")

      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: ref_1.id,
                     request_type_id: 1,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: ref_1.id,
                     request_type_id: 2,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: ref_2.id,
                     request_type_id: 2,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_2.id,
                     request_type_id: 2,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_3.id,
                     request_type_id: 2,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_3.id,
                     request_type_id: 2,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_4.id,
                     request_type_id: 2,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_1.id,
                     request_type_id: 2,
                     event_name_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      expected = [ref_1.address, ref_3.address, ref_2.address]
      expect(Url.find_all_referrers("http://www.facebook.com")).to eq(expected)
    end
  end

  

end
