require_relative '../spec_helper'

RSpec.describe "Payload" do
  describe "validation" do
    it "is invalid without a URL" do
      payload = Payload.create(
                               requested_at: 1,
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: 1,
                               event_name_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a requested_at" do
      payload = Payload.create(
                               url_id: 1,
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: 1,
                               event_name_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a responded_in" do
      payload = Payload.create(
                               url_id: 1,
                               requested_at: 1,
                               referred_by_id: 1,
                               request_type_id: 1,
                               event_name_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a referred_by_id" do
      payload = Payload.create(
                               url_id: 1,
                               requested_at: 1,
                               responded_in: 1,
                               request_type_id: 1,
                               event_name_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a request_type_id" do
      payload = Payload.create(
                               url_id: 1,
                               requested_at: 1,
                               responded_in: 1,
                               referred_by_id: 1,
                               event_name_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without an event_name_id" do
      payload = Payload.create(
                               url_id: 1,
                               requested_at: 1,
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without an u_agent_id" do
      payload = Payload.create(
                               url_id: 1,
                               requested_at: 1,
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: 1,
                               event_name_id: 1,
                               resolution_id: 2,
                               ip_id: 1
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without a resolution_id" do
      payload = Payload.create(
                               url_id: 1,
                               requested_at: 1,
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: 1,
                               event_name_id: 1,
                               u_agent_id: 1,
                               ip_id: 1
                              )

      expect(payload).to_not be_valid
    end

    it "is invalid without an ip_id" do
      payload = Payload.create(
                               url_id: 1,
                               requested_at: 1,
                               responded_in: 1,
                               referred_by_id: 1,
                               request_type_id: 1,
                               event_name_id: 1,
                               u_agent_id: 1,
                               resolution_id: 2,
                              )

      expect(payload).to_not be_valid
    end

  end
end
