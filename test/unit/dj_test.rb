require 'test_helper'

class DjTest < ActiveSupport::TestCase
  should validate_uniqueness_of :name
  should have_and_belong_to_many :styles
  should have_and_belong_to_many :events
  
  test "should get the top DJs" do
    assert Dj.top, "Top DJs are missing"
  end
end
