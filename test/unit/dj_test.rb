require 'test_helper'

class DjTest < ActiveSupport::TestCase
  should_validate_uniqueness_of :name
end
