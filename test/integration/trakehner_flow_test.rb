require 'test_helper'

describe "Trakehner flow", :integration do
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Welcome#index"
  end
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end
end
