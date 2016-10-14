ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

Capybara.app = RushHour::Server

RSpec.configure do |c|
  c.include Capybara::DSL
end

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
  c.after(:all) do
    DatabaseCleaner.clean
  end
end


def create_test_client
  @client = Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")
end


def create_test_payloads
  create_test_client
  params1 = {"payload"=>
              "{\"url\":\"http://jumpstartlab.com/blog\",\"requestedAt\":\"2013-02-16 21:38:28 -0700\",\"respondedIn\":37,\"referredBy\":\"http://jumpstartlab.com\",\"requestType\":\"GET\",\"eventName\": \"socialLogin\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17\",\"resolutionWidth\":\"1920\",\"resolutionHeight\":\"1280\",\"ip\":\"63.29.38.211\"}",
              "splat"=>[],
              "captures"=>["jumpstartlab"],
              "IDENTIFIER"=>"jumpstartlab"
            }
  parsed_data1 = DataLoader.new(params1).load_payload

  params2 = {"payload"=>
              "{\"url\":\"http://jumpstartlab.com/blog\",\"requestedAt\":\"2013-02-16 05:38:28 -0700\",\"respondedIn\":24,\"referredBy\":\"http://jumpstartlab.com\",\"requestType\":\"GET\",\"eventName\": \"socialLogin\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17\",\"resolutionWidth\":\"1920\",\"resolutionHeight\":\"1280\",\"ip\":\"63.29.38.211\"}",
              "splat"=>[],
              "captures"=>["jumpstartlab"],
              "IDENTIFIER"=>"jumpstartlab"
            }
  parsed_data2 = DataLoader.new(params2).load_payload
end
