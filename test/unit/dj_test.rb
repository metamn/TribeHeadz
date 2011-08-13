require 'test_helper'

class DjTest < ActiveSupport::TestCase
  should validate_uniqueness_of :name
  
  test "should get the top DJs" do
    assert Dj.top, "Top DJs are missing"
  end
end
