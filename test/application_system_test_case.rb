require "test_helper"
# require 'capybara/poltergeist'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  ###  Using selenium. Selenium is slow because it opens
  ### the browser and you can then watch the tests in
  ### real time.
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  ###  A truly headless testing solution.  But hasn't been updated
  ### in three years, so not going to use this.  Leaving it here
  ### since I want to create a list of options with adds vs dis-adds.
  # driven_by :poltergeist
end
