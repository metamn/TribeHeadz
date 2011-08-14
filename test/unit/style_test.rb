require 'test_helper'

class StyleTest < ActiveSupport::TestCase
  should validate_uniqueness_of :name
  should have_and_belong_to_many :djs
  should have_and_belong_to_many :events
  
  test "should get top styles" do
    assert_not_nil Style.top, "Top music styles are missing"
  end
end
