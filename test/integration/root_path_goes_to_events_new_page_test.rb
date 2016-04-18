require 'test_helper'

class RootPathGoesToEventsNewPageTest < ActionDispatch::IntegrationTest
  test "root path goes to new page" do
    visit root_path
    assert page.has_content?("Please Select The Date You'd Like To View")
  end
end
