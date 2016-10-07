require_relative '../spec_helper'

RSpec.describe "U_Agent" do

  describe "validation" do
    it "is invalid without a browser" do
      u_agent = UAgent.new(browser: "test")

      expect(u_agent).to_not be_valid
    end
    it "is invalid without a operating_system" do
      u_agent = UAgent.new(operating_system: "test")

      expect(u_agent).to_not be_valid
    end
  end

end
