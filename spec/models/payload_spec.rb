require_relative '../spec_helper'

RSpec.describe "Payload" do
  describe "validation" do
    it "is invalid without a URL" do
      payload = Payload.create(
                               requestedAt: "a",
                               respondedIn: 1,
                               referredBy: "a",
                               requestType: "a",
                               eventName: "a",
                               userAgent: "a",
                               resolutionWidth: 1,
                               resolutionHeight: 2,
                               ip: "a"
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a requestedAt" do
      payload = Payload.create(
                               url: "test",
                               respondedIn: 1,
                               referredBy: "a",
                               requestType: "a",
                               eventName: "a",
                               userAgent: "a",
                               resolutionWidth: 1,
                               resolutionHeight: 2,
                               ip: "a"
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a respondedIn" do
      payload = Payload.create(
                               url: "test",
                               requestedAt: "a",
                               referredBy: "a",
                               requestType: "a",
                               eventName: "a",
                               userAgent: "a",
                               resolutionWidth: 1,
                               resolutionHeight: 2,
                               ip: "a"
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a referredBy" do
      payload = Payload.create(
                               url: "test",
                               requestedAt: "a",
                               respondedIn: 1,
                               requestType: "a",
                               eventName: "a",
                               userAgent: "a",
                               resolutionWidth: 1,
                               resolutionHeight: 2,
                               ip: "a"
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a requestType" do
      payload = Payload.create(
                               url: "test",
                               requestedAt: "a",
                               respondedIn: 1,
                               referredBy: "a",
                               eventName: "a",
                               userAgent: "a",
                               resolutionWidth: 1,
                               resolutionHeight: 2,
                               ip: "a"
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without an eventName" do
      payload = Payload.create(
                               url: "test",
                               requestedAt: "a",
                               respondedIn: 1,
                               referredBy: "a",
                               requestType: "a",
                               userAgent: "a",
                               resolutionWidth: 1,
                               resolutionHeight: 2,
                               ip: "a"
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without an userAgent" do
      payload = Payload.create(
                               url: "test",
                               requestedAt: "a",
                               respondedIn: 1,
                               referredBy: "a",
                               requestType: "a",
                               eventName: "a",
                               resolutionWidth: 1,
                               resolutionHeight: 2,
                               ip: "a"
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a resolutionWidth" do
      payload = Payload.create(
                               url: "test",
                               requestedAt: "a",
                               respondedIn: 1,
                               referredBy: "a",
                               requestType: "a",
                               eventName: "a",
                               userAgent: "a",
                               resolutionHeight: 2,
                               ip: "a"
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a resolutionHeight" do
      payload = Payload.create(
                               url: "test",
                               requestedAt: "a",
                               respondedIn: 1,
                               referredBy: "a",
                               requestType: "a",
                               eventName: "a",
                               userAgent: "a",
                               resolutionWidth: 1,
                               ip: "a"
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without an ip" do
      payload = Payload.create(
                               url: "test",
                               requestedAt: "a",
                               respondedIn: 1,
                               referredBy: "a",
                               requestType: "a",
                               eventName: "a",
                               userAgent: "a",
                               resolutionWidth: 1,
                               resolutionHeight: 2,
                              )

      expect(payload).to_not be_valid
    end

  end
end
