require_relative '../spec_helper'
# User Story
# When a user enters invalid client identifier
# Then they are displayed to error


RSpec.describe "When a user triggers an error" do
  it "displays a client error message" do
    visit '/sources/thingy'

      expect(page).to have_content("Please ensure the client exists\n")
  end

  it "displays payload error message" do
    create_test_client
    visit '/sources/jumpstartlab'

    expect(page).to have_content("No payloads have been received for this source\n")
  end

  it "displays a url error message" do
    create_test_client
    visit '/sources/jumpstartlab/urls/test'

    expect(page).to have_content("This URL has not been requested")
  end
end
