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

    within("#min") do
      expect(page).to have_content("24")
    end
  end

  it "displays the proper response time" do
    create_test_client
    create_test_payloads
    visit '/sources/jumpstartlab/urls/blog'

    within("#times") do
      expect(page).to have_content("24")
    end
  end

  it "displays the proper verbs" do
    create_test_client
    create_test_payloads
    expected = "GET"
    visit '/sources/jumpstartlab/urls/blog'

    within("#verbs") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the proper referrers" do
    create_test_client
    create_test_payloads
    expected = "http://jumpstartlab.com"
    visit '/sources/jumpstartlab/urls/blog'

    within("#referrers") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the proper agents" do
    create_test_client
    create_test_payloads
    expected = "Chrome on Macintosh"
    visit '/sources/jumpstartlab/urls/blog'

    within("#agents") do
      expect(page).to have_content(expected)
    end
  end

  it "shows the url" do
    create_test_client
    create_test_payloads
    expected = 'http://jumpstartlab.com/blog'
    visit '/sources/jumpstartlab/urls/blog'

    within("#address") do
      expect(page).to have_content(expected)
    end
  end

end
