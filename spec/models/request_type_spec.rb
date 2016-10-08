require_relative '../spec_helper'

RSpec.describe "Request_type" do

  describe "validation" do
    it "is invalid without an http_verb" do
      request_type = RequestType.new()

      expect(request_type).to_not be_valid
    end
  end

  describe "returns http verbs" do
    it "returns most frequently used http verb" do
      RequestType.create(http_verb: "GET")
      RequestType.create(http_verb: "GET")
      RequestType.create(http_verb: "POST")

      expect(RequestType.most_frequent).to eq("GET")
    end
  end

end
