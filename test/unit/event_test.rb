require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should validate_uniqueness_of :name
end
