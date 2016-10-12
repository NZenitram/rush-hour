require_relative '../spec_helper'
# When a user visits the relative path for a client's url
# Then analytical data is displayed


RSpec.describe "When a user visits a URL info page" do
  it "displays a title" do
    create_test_client
    create_test_payloads
    visit '/sources/jumpstartlab/urls/blog'

    within("h1") do
      expect(page).to have_content("URL Information")
    end
  end

  it "displays the url address" do
    create_test_client
    create_test_payloads
    visit '/sources/jumpstartlab/urls/blog'

    within("h2") do
      expect(page).to have_content("http://jumpstartlab.com/blog")
    end
  end

  it "displays a max response time" do
    create_test_client
    create_test_payloads
    visit '/sources/jumpstartlab/urls/blog'

    within("#max") do
      expect(page).to have_content("37")
    end
  end

  it "displays a min response time" do
    create_test_client
    create_test_payloads
    visit '/sources/jumpstartlab/urls/blog'
    save_and_open_page

    within("#min") do
      expect(page).to have_content("24")
    end
  end




end
