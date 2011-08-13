require 'test_helper'

class StyleTest < ActiveSupport::TestCase
  should validate_uniqueness_of :name
end
