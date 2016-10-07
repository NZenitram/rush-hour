require_relative '../spec_helper'

RSpec.describe "Url" do

  describe "validation" do
    it "is invalid without an address" do
      url = Url.new()

      expect(url).to_not be_valid
    end
  end

end
