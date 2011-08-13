require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should_validate_uniqueness_of :name
end
