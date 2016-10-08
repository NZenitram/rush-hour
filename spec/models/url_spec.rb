require_relative '../spec_helper'

RSpec.describe "Url" do

  describe "validation" do
    it "is invalid without an address" do
      url = Url.new()

      expect(url).to_not be_valid
    end
  end

  describe "order URL" do
    it "orders URLS from most requested to least requested" do
      Url.create(address: "http://www.google.com")
      Url.create(address: "http://www.google.com")
      Url.create(address: "http://www.github.com")
      Url.create(address: "http://www.github.com")
      Url.create(address: "http://www.reddit.com")
      Url.create(address: "http://www.reddit.com")
      Url.create(address: "http://www.reddit.com")


      expect(Url.order_addresses).to_not eq(["http://www.google.com",
                                             "http://www.github.com"
                                          ])
      expect(Url.order_addresses).to eq(["http://www.reddit.com",
                                         "http://www.google.com",
                                         "http://www.github.com"
                                       ])
    end
  end


end
