require_relative '../spec_helper'

RSpec.describe "Event" do

  describe "validation" do
    it "is invalid without a name" do
      event = Event.new()

      expect(event).to_not be_valid
    end
  end

end
