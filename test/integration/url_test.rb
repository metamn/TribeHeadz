require 'test_helper'
require 'capybara/rails'

class UrlTest < ActionDispatch::IntegrationTest
  include Capybara
  fixtures :all
  
  test "Application name should be 'TribeHeadz'" do
    visit "/"
    assert page.has_content?('TribeHeadz'), 'Application title is not TribeHeadz'
  end
  
  test "First page should display the top 10 music styles" do
    visit "/"
    assert page.has_content?('style'), "No pop styles on frontpage"
  end
  
  test "Clicking on a music style should show the associated DJs" do
    visit "/"
    click_link "Style1"
    assert page.has_content?('Dj'), "No DJs for a music style"
  end
end
