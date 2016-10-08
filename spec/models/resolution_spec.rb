require_relative '../spec_helper'

RSpec.describe "Resolution" do

  describe "validation" do
    it "is invalid without a height" do
      resolution = Resolution.new(width: 11)

      expect(resolution).to_not be_valid
    end
    it "is invalid without a width" do
      resolution = Resolution.new(height: 11)

      expect(resolution).to_not be_valid
    end

  end

end
