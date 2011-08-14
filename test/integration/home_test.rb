require 'test_helper'
require 'capybara/rails'

class HomeTest < ActionDispatch::IntegrationTest
  include Capybara
  
  test "Application name should be 'TribeHeadz'" do
    visit "/"
    assert page.has_content?('TribeHeadz'), 'Application title is not TribeHeadz'
  end
  
  test "First page should display the top 10 music styles" do
    visit "/"
    assert page.has_content?('style'), "No pop styles on frontpage"
  end
end
