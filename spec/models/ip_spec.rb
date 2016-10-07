require_relative '../spec_helper'

RSpec.describe "Ip" do

  describe "validation" do
    it "is invalid without an address" do
      ip = Ip.new()

      expect(ip).to_not be_valid
    end
  end

end
