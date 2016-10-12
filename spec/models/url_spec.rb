require_relative '../spec_helper'
require 'pry'

RSpec.describe "Url" do

  describe "validation" do
    it "is invalid without an address" do
      url = Url.new()

      expect(url).to_not be_valid
    end

    it "is invalid if address is a duplicate" do
      url1 = Url.create(address: "test")
      url2 = Url.new(address: "test")

      expect(url2).to_not be_valid
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
      # url_2 = Url.find_or_create_by(address: "http://www.google.com")
      url_2 = Url.find_or_create_by(address: "http://www.github.com")
      url_3 = Url.find_or_create_by(address: "http://www.reddit.com")

      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_3.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )

      expect(url_1.max_response_time).to eq(35)
      expect(url_2.max_response_time).to eq(45)
      expect(url_3.max_response_time).to eq(55)
    end

    it "can retrieve minimimum response time from a URL" do
      url_1 = Url.find_or_create_by(address: "http://www.google.com")
      url_2 = Url.find_or_create_by(address: "http://www.github.com")
      url_3 = Url.find_or_create_by(address: "http://www.reddit.com")

      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_3.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )

      expect(url_1.min_response_time).to eq(25)
      expect(url_2.min_response_time).to eq(45)
      expect(url_3.min_response_time).to eq(55)
    end

    it "can retrieve all response times from a URL" do
      url_1 = Url.find_or_create_by(address: "http://www.google.com")
      url_2 = Url.find_or_create_by(address: "http://www.reddit.com")

      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: 1,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )

      expect(url_1.list_all_response_times).to eq([45, 35, 25])
      expect(url_2.list_all_response_times).to eq([55])
    end

    it "can retrieve HTTP verbs" do
      url_1 = Url.find_or_create_by(address: "http://www.google.com")
      url_2 = Url.find_or_create_by(address: "http://www.reddit.com")

      type_1 = RequestType.find_or_create_by(http_verb: "GET")
      type_2 = RequestType.find_or_create_by(http_verb: "POST")
      type_3 = RequestType.find_or_create_by(http_verb: "DELETE")

      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 25,
                     referred_by_id: 1,
                     request_type_id: type_1.id,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: 1,
                     request_type_id: type_2.id,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: 1,
                     request_type_id: type_3.id,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: type_1.id,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_2.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: 1,
                     request_type_id: type_1.id,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )

      expect(url_1.list_all_http_verbs).to eq(["GET", "POST", "DELETE"])
      expect(url_2.list_all_http_verbs).to eq(["GET"])
    end

    it "can retrieve 3 popular referrers" do
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
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 35,
                     referred_by_id: ref_1.id,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 45,
                     referred_by_id: ref_2.id,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_2.id,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_3.id,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_3.id,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_4.id,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 55,
                     referred_by_id: ref_1.id,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 65,
                     referred_by_id: ref_1.id,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )
      Payload.create(url_id: url_1.id,
                     requested_at: "2013-02-16 21:38:28 -0700",
                     responded_in: 15,
                     referred_by_id: ref_2.id,
                     request_type_id: 2,
                     event_id: 1,
                     u_agent_id: 1,
                     resolution_id: 2,
                     ip_id: 1
                              )

      expected = [ref_1.address, ref_2.address, ref_3.address]
      expect(url_1.find_top_referrers).to eq(expected)
    end
  end

  it "can retrieve 3 popular user agents" do
    url_1 = Url.find_or_create_by(address: "http://www.facebook.com")

    ref_1 = UAgent.find_or_create_by(browser: "Chrome", operating_system: "OSX")
    ref_2 = UAgent.find_or_create_by(browser: "Chrome", operating_system: "Windows 10")
    ref_3 = UAgent.find_or_create_by(browser: "FireFox", operating_system: "Windows 10")
    ref_4 = UAgent.find_or_create_by(browser: "FireFox", operating_system: "OSX")

    Payload.create(url_id: url_1.id,
                   requested_at: "2013-02-16 21:38:28 -0700",
                   responded_in: 25,
                   referred_by_id: 1,
                   request_type_id: 1,
                   event_id: 1,
                   u_agent_id: ref_1.id,
                   resolution_id: 2,
                   ip_id: 1
                            )
    Payload.create(url_id: url_1.id,
                   requested_at: "2013-02-16 21:38:28 -0700",
                   responded_in: 35,
                   referred_by_id: 1,
                   request_type_id: 2,
                   event_id: 1,
                   u_agent_id: ref_1.id,
                   resolution_id: 2,
                   ip_id: 1
                            )
    Payload.create(url_id: url_1.id,
                   requested_at: "2013-02-16 21:38:28 -0700",
                   responded_in: 45,
                   referred_by_id: 2,
                   request_type_id: 2,
                   event_id: 1,
                   u_agent_id: ref_2.id,
                   resolution_id: 2,
                   ip_id: 1
                            )
    Payload.create(url_id: url_1.id,
                   requested_at: "2013-02-16 21:38:28 -0700",
                   responded_in: 55,
                   referred_by_id: 2,
                   request_type_id: 2,
                   event_id: 1,
                   u_agent_id: ref_2.id,
                   resolution_id: 2,
                   ip_id: 1
                            )
    Payload.create(url_id: url_1.id,
                   requested_at: "2013-02-16 21:38:28 -0700",
                   responded_in: 55,
                   referred_by_id: 3,
                   request_type_id: 2,
                   event_id: 1,
                   u_agent_id: ref_3.id,
                   resolution_id: 2,
                   ip_id: 1
                            )
    Payload.create(url_id: url_1.id,
                   requested_at: "2013-02-16 21:38:28 -0700",
                   responded_in: 55,
                   referred_by_id: 3,
                   request_type_id: 2,
                   event_id: 1,
                   u_agent_id: ref_3.id,
                   resolution_id: 2,
                   ip_id: 1
                            )
    Payload.create(url_id: url_1.id,
                   requested_at: "2013-02-16 21:38:28 -0700",
                   responded_in: 55,
                   referred_by_id: 2,
                   request_type_id: 2,
                   event_id: 1,
                   u_agent_id: ref_4.id,
                   resolution_id: 2,
                   ip_id: 1
                            )
    Payload.create(url_id: url_1.id,
                   requested_at: "2013-02-16 21:38:28 -0700",
                   responded_in: 55,
                   referred_by_id: 1,
                   request_type_id: 2,
                   event_id: 1,
                   u_agent_id: ref_1.id,
                   resolution_id: 2,
                   ip_id: 1
                            )
    expected = [[ref_1.browser, ref_1.operating_system],
                [ref_2.browser, ref_2.operating_system],
                [ref_3.browser, ref_3.operating_system]
               ]

    expect(url_1.find_top_agents).to eq(expected)
  end


end
