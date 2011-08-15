require 'test_helper'
require 'capybara/rails'

class ApplicationTest < ActionDispatch::IntegrationTest
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
    assert page.has_content?('gigs'), "No events for a dj"
  end
  
  test "Clicking on an event should display a flyer" do
    visit dj_events_url(djs(:one).id, :style => styles(:one).id)
    click_link 'Event1'
    assert page.has_selector?('img'), "No flyer for an event"
  end
  
  test "Listing gigs/events must show the flyer too" do
    visit dj_events_url(djs(:one).id, :style => styles(:one).id)
    assert page.has_selector?('img'), "No flyer for an event"  
  end
  
  test "When listing music styles the associated nr. of total DJs must be shown" do
    visit "/"
    assert page.has_content?('('), 'Total number of DJs per music style is missing'
  end
  
  test "When listing DJs the number of gigs a DJ has must be shown too" do
    visit style_djs_url(styles(:one).id)
    assert page.has_content?('('), 'Total number of gigs per DJ is missing'
  end
  
  
end
