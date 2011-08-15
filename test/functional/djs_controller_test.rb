require 'test_helper'

class DjsControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index, :style_id => styles(:one).id
    assert_response :success
  end
  
  test "should display the top DJs of a certain style" do
    get :index, :style_id => styles(:one).id
    assert_not_nil assigns(:djs)
  end

end
