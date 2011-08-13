# Storing events
class Event < ActiveRecord::Base
  validates_uniqueness_of :name

end
