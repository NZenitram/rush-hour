require_relative '../spec_helper'

RSpec.describe "Data_loader" do
  describe "DataLoader" do
    it "can_parse_JSON" do
      payload = '{
                  "url":"http://jumpstartlab.com/blog",
                  "requestedAt":"2013-02-16 21:38:28 -0700",
                  "respondedIn":37,
                  "referredBy":"http://jumpstartlab.com",
                  "requestType":"GET",
                  "eventName": "socialLogin",
                  "userAgent":"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                  "resolutionWidth":"1920",
                  "resolutionHeight":"1280",
                  "ip":"63.29.38.211"
                }'
      expected = {
                  "url"=>"http://jumpstartlab.com/blog",
                  "requestedAt"=>"2013-02-16 21:38:28 -0700",
                  "respondedIn"=>37,
                  "referredBy"=>"http://jumpstartlab.com",
                  "requestType"=>"GET",
                  "eventName"=>"socialLogin",
                  "userAgent"=>"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                  "resolutionWidth"=>"1920",
                  "resolutionHeight"=>"1280",
                  "ip"=>"63.29.38.211"
                }

      expect(DataLoader.new(payload).parsed_data).to eq(expected)
    end
  end
end
