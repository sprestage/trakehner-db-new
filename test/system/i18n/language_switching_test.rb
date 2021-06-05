require "test_helper"

class TrakehnerFlowTest < ActionDispatch::IntegrationTest

  test "Swaps between languages" do
    visit root_path
puts 111
    page.must_have_content "The Unofficial Trakehner Database"
puts 222
    assert_title "The Unofficial Trakehner Database"
puts 333
    click_on 'Deutsche'
puts 444
    page.must_have_content "Der Inoffiziell Trakehner Datenbank"
puts 555
    page.must_have_content "Pferde"
puts 666
    click_on 'English'
puts 777    
    page.must_have_content "The Unofficial Trakehner Database"
    page.must_have_content "Horses"
  end
end

#
# feature "Langage switching" do
#   scenario "Swaps between languages" do
#     visit root_path
#     page.must_have_content "The Unofficial Trakehner Database"
#     click_on 'Deutsche'
#     page.must_have_content "Der Inoffiziell Trakehner Datenbank"
#     page.must_have_content "Pferde"
#     click_on 'English'
#     page.must_have_content "The Unofficial Trakehner Database"
#     page.must_have_content "Horses"
#   end
# end
