require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should validate_uniqueness_of :name
  
  should have_and_belong_to_many :styles
  should have_and_belong_to_many :djs
end
