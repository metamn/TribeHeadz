require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  
  test "should list all events of a DJ" do
    get :index, :dj_id => djs(:one).id, :style => styles(:one).id
    assert_not_nil assigns(:events)
  end
  
  test "should show the event" do
    get :show, :id => events(:one)
    assert_not_nil assigns(:event)
  end

  test "should list the music style for the event" do
    get :index, :dj_id => djs(:one).id, :style => styles(:one).id
    assert_not_nil assigns(:style)
  end
end
