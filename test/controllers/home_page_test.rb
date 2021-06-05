require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test "Home page contains text" do
    visit root_path
    assert_includes(body, "Horse")
  end

  test "Home page has a correct title" do
    visit root_path
    assert_title "The Unofficial Trakehner Database"
  end
end
