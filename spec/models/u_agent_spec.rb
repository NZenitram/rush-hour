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

  describe "web browser breakdown" do
    it "returns web browser breakdown" do
      UAgent.create(browser: "IE",
                    operating_system: "Windows 10"
                    )
      UAgent.create(browser: "IE",
                    operating_system: "Windows 8"
                    )
      UAgent.create(browser: "IE",
                    operating_system: "Windows 10"
                    )
      UAgent.create(browser: "Chrome",
                    operating_system: "Windows 7"
                    )
      UAgent.create(browser: "Chrome",
                    operating_system: "Windows 10"
                    )
      UAgent.create(browser: "Safari",
                    operating_system: "OS X"
                    )

      expect(UAgent.web_browser_breakdown).to eq(0)
    end
  end

end
