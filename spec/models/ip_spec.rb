require_relative '../spec_helper'

RSpec.describe "Ip" do

  describe "validation" do
    it "is invalid without an address" do
      ip = Ip.new()

      expect(ip).to_not be_valid
    end

    it "is invalid if address is a duplicate" do
      ip1 = Ip.create(address: "63.29.38.211")
      ip2 = Ip.new(address: "63.29.38.211")


      expect(ip2).to_not be_valid
    end
  end

end
