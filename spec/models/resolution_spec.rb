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

    it "is valid with a width and height" do
      resolution = Resolution.create(height: 1920, width: 1080)

      expect(resolution).to be_valid
    end

  end

  describe "resolution_occurances" do
    it "returns resolutions" do
      Resolution.create(height: 1920, width: 1080)
      Resolution.create(height: 1920, width: 1200)
      Resolution.create(height: 1200, width: 900)

    expect(Resolution.resolution_occurances).to_not eq(0)

    expected = ["1200 x 900", "1920 x 1080", "1920 x 1200"]

    expect(Resolution.resolution_occurances).to eq(expected)
    end
  end

end
