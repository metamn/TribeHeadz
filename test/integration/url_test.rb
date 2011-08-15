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
  
  test "Clicking on a DJ must list gigs/events" do
    visit style_djs_url(styles(:one).id)
    click_link "Dj1"
    assert page.has_content?('Gigs'), "No events for a dj"
  end
  
  test "Clicking on an event should display a flyer" do
    visit dj_events_url(djs(:one).id)
    click_link 'Event1'
    assert page.has_selector?('img'), "No flyer for an event"
  end
end
