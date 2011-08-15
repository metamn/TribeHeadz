require 'test_helper'

class StylesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get top music styles" do
    get :index
    assert_not_nil assigns[:top]
  end
end
