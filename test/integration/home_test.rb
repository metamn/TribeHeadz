require 'test_helper'
require 'capybara/rails'

class HomeTest < ActionDispatch::IntegrationTest
  include Capybara
  
  test "Application name should be 'TribeHeadz'" do
    visit "/"
    assert page.has_content?('TribeHeadz'), 'Application title is not TribeHeadz'
  end
end
