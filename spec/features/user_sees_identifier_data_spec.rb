require_relative '../spec_helper'


RSpec.describe "When a user visits a URL info page" do

  it "displays the client identifier" do
    create_test_client
    create_test_payloads
    expected = 'jumpstartlab'
    visit '/sources/jumpstartlab'

    within("#client") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the average response time" do
    create_test_client
    create_test_payloads
    expected = 30
    visit '/sources/jumpstartlab'

    within("#average_response") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the max response time" do
    create_test_client
    create_test_payloads
    expected = 37
    visit '/sources/jumpstartlab'

    within("#max_response") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the min response time" do
    create_test_client
    create_test_payloads
    expected = 24
    visit '/sources/jumpstartlab'

    within("#min_response") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the most frequent response time" do
    create_test_client
    create_test_payloads
    expected = "GET"
    visit '/sources/jumpstartlab'

    within("#frequent_response") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the http verbs" do
    create_test_client
    create_test_payloads
    expected = ["GET"]
    visit '/sources/jumpstartlab'

    within("#verbs") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the urls" do
    create_test_client
    create_test_payloads
    expected = "http://jumpstartlab.com/blog"
    visit '/sources/jumpstartlab'

    within("#urls") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the browsers" do
    create_test_client
    create_test_payloads
    expected = "Chrome"
    visit '/sources/jumpstartlab'

    within("#browsers") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the operating systems" do
    create_test_client
    create_test_payloads
    expected = "Macintosh"
    visit '/sources/jumpstartlab'

    within("#os") do
      expect(page).to have_content(expected)
    end
  end

  it "displays the resolutions" do
    create_test_client
    create_test_payloads
    expected = "1280 x 1920"
    visit '/sources/jumpstartlab'

    within("#resolutions") do
      expect(page).to have_content(expected)
    end
  end

end
