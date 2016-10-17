require_relative '../spec_helper'

RSpec.describe "U_Agent" do

  describe "validation" do
    it "is invalid without a browser" do
      u_agent = UAgent.new(browser: "test")

      expect(u_agent).to_not be_valid
    end

    it "is invalid without an operating_system" do
      u_agent = UAgent.new(operating_system: "test")

      expect(u_agent).to_not be_valid
    end

    it "is valid with an operating_system and browser" do
      u_agent = UAgent.find_or_create_by(browser: "IE",
                    operating_system: "Windows 10"
                    )

      expect(u_agent).to be_valid
    end

  end

  describe "web browser breakdown" do
    it "returns web browser breakdown" do
      UAgent.find_or_create_by(browser: "IE",
                    operating_system: "Windows 10"
                    )
      UAgent.find_or_create_by(browser: "IE",
                    operating_system: "Windows 8"
                    )
      UAgent.find_or_create_by(browser: "IE",
                    operating_system: "Windows 10"
                    )
      UAgent.find_or_create_by(browser: "Chrome",
                    operating_system: "Windows 7"
                    )
      UAgent.find_or_create_by(browser: "Chrome",
                    operating_system: "Windows 10"
                    )
      UAgent.find_or_create_by(browser: "Safari",
                    operating_system: "OS X"
                    )

      expect(UAgent.web_browser_breakdown).to_not eq(0)


      expected = {"IE"=>0.4, "Chrome"=>0.4, "Safari"=>0.2}
      expect(UAgent.web_browser_breakdown).to eq(expected)
    end
  end

  describe "operating_system breakdown" do
    it "returns operating_system breakdown" do
      UAgent.find_or_create_by(browser: "IE",
                    operating_system: "Windows 10"
                    )
      UAgent.find_or_create_by(browser: "IE",
                    operating_system: "Windows 8"
                    )
      UAgent.find_or_create_by(browser: "IE",
                    operating_system: "Windows 10"
                    )
      UAgent.find_or_create_by(browser: "Chrome",
                    operating_system: "Windows 7"
                    )
      UAgent.find_or_create_by(browser: "Chrome",
                    operating_system: "Windows 10"
                    )
      UAgent.find_or_create_by(browser: "Safari",
                    operating_system: "OS X"
                    )

      expect(UAgent.operating_system_breakdown).to_not eq(0)


      expected =  {"Windows 7"=>0.2, "Windows 8"=>0.2, "OS X"=>0.2, "Windows 10"=>0.4}
      expect(UAgent.operating_system_breakdown).to eq(expected)
    end
  end

end
