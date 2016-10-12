require_relative '../spec_helper'
# When a user visits an event page
# Then they see the event data by hour

RSpec.describe "When a user visits an event page" do
  it "displays event data by hour" do
    create_test_client
    create_test_payloads
    visit '/sources/jumpstartlab/events/socialLogin'

    within("table") do
      expect(page).to have_content(4)
      expect(page).to have_content(12)
      expect(page).to have_content(1)
    end
  end

  it "displays rows for each hour present" do
    create_test_client
    create_test_payloads
    visit '/sources/jumpstartlab/events/socialLogin'

    within("table") do
    expect(page).to have_selector('td', count: 4)
    end
  end

  it "displays the event name" do
    create_test_client
    create_test_payloads
    visit '/sources/jumpstartlab/events/socialLogin'

    within("h2") do
      expect(page).to have_content("socialLogin")
    end
  end

  it "displays the client name" do
    create_test_client
    create_test_payloads
    visit '/sources/jumpstartlab/events/socialLogin'

    within("h1") do
      expect(page).to have_content("jumpstartlab")
    end
  end

end
