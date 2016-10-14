require_relative '../spec_helper'

RSpec.describe "Referred_by" do

  describe "validation" do
    it "is invalid without an address" do
      referred_by = ReferredBy.new()

      expect(referred_by).to_not be_valid
    end

    it "is invalid if address is a duplicate" do
      referred_by1 = ReferredBy.create(address: "test")
      referred_by2 = ReferredBy.new(address: "test")


      expect(referred_by2).to_not be_valid
    end
  end

end
