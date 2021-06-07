require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  puts "ApplicationSystemTestCase"
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
