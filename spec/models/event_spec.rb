require_relative '../spec_helper'

RSpec.describe "Event" do

  describe "validation" do
    it "is invalid without a name" do
      event = Event.new()

      expect(event).to_not be_valid
    end

    it "is invalid if name is a duplicate" do
      event1 = Event.create(name: "socialLogin")
      event2 = Event.new(name: "socialLogin")

      expect(event2).to_not be_valid
    end

    it "is valid with a name" do
      event = Event.new(name: "socialLogin")

      expect(event).to be_valid
    end


  end

end
