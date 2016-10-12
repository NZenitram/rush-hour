require_relative '../spec_helper'

RSpec.describe "Data_loader" do
  describe "DataLoader" do
    it "can_parse_JSON" do
      Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")

      params = {"payload"=>
                  "{\"url\":\"http://jumpstartlab.com/blog\",\"requestedAt\":\"2013-02-16 21:38:28 -0700\",\"respondedIn\":37,\"referredBy\":\"http://jumpstartlab.com\",\"requestType\":\"GET\",\"eventName\": \"socialLogin\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17\",\"resolutionWidth\":\"1920\",\"resolutionHeight\":\"1280\",\"ip\":\"63.29.38.211\"}",
                  "splat"=>[],
                  "captures"=>["jumpstartlab"],
                  "IDENTIFIER"=>"jumpstartlab"
                }
      parsed_data = DataLoader.new(params)
      expected = {
                  "url"=>"http://jumpstartlab.com/blog",
                  "requestedAt"=>"2013-02-16 21:38:28 -0700",
                  "respondedIn"=>37,
                  "referredBy"=>"http://jumpstartlab.com",
                  "requestType"=>"GET",
                  "eventName"=>"socialLogin",
                  "userAgent"=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                  "resolutionWidth"=>"1920",
                  "resolutionHeight"=>"1280",
                  "ip"=>"63.29.38.211"
                }

      expect(parsed_data.payload).to eq(expected)
    end

    it "can load a payload" do
      params = {"payload"=>
                  "{\"url\":\"http://jumpstartlab.com/blog\",\"requestedAt\":\"2013-02-16 21:38:28 -0700\",\"respondedIn\":37,\"referredBy\":\"http://jumpstartlab.com\",\"requestType\":\"GET\",\"eventName\": \"socialLogin\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17\",\"resolutionWidth\":\"1920\",\"resolutionHeight\":\"1280\",\"ip\":\"63.29.38.211\"}",
                  "splat"=>[],
                  "captures"=>["jumpstartlab"],
                  "IDENTIFIER"=>"jumpstartlab"
                }
      payload_data = DataLoader.new(params).load_payload

      expect(payload_data).to be_a(Payload)
      expect(payload_data.requested_at).to eq("2013-02-16 21:38:28 -0700")
    end

    it "can search payloads" do
      params = {"payload"=>
                  "{\"url\":\"http://jumpstartlab.com/blog\",\"requestedAt\":\"2013-02-16 21:38:28 -0700\",\"respondedIn\":37,\"referredBy\":\"http://jumpstartlab.com\",\"requestType\":\"GET\",\"eventName\": \"socialLogin\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17\",\"resolutionWidth\":\"1920\",\"resolutionHeight\":\"1280\",\"ip\":\"63.29.38.211\"}",
                  "splat"=>[],
                  "captures"=>["jumpstartlab"],
                  "IDENTIFIER"=>"jumpstartlab"
                }
      payload_data = DataLoader.new(params)

      expect(payload_data.search_payload).to eq(nil)

      final_payload = payload_data.load_payload

      expect(payload_data.search_payload).to eq(final_payload)
    end

  end
end
