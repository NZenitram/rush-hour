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

      expect(UAgent.web_browser_breakdown).to_not eq(0)


      expected = {"IE"=>0.5, "Chrome"=>0.333, "Safari"=>0.167}
      expect(UAgent.web_browser_breakdown).to eq(expected)
    end
  end

  describe "operating_system breakdown" do
    it "returns operating_system breakdown" do
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

      expect(UAgent.operating_system_breakdown).to_not eq(0)


      expected = {"Windows 7"=>0.167, "Windows 8"=>0.167, "OS X"=>0.167, "Windows 10"=>0.5}
      expect(UAgent.operating_system_breakdown).to eq(expected)
    end
  end
  
end
