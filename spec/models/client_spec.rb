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
end
