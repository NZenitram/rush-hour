require_relative '../spec_helper'

RSpec.describe "Referred_by" do

  describe "validation" do
    it "is invalid without an address" do
      referred_by = ReferredBy.new()

      expect(referred_by).to_not be_valid
    end
  end

end
