require 'test_helper'

class StyleTest < ActiveSupport::TestCase
  should_validate_uniqueness_of :name
end
