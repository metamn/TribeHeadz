# Storing events
class Event < ActiveRecord::Base
  validates_uniqueness_of :name

  has_and_belongs_to_many :styles
  has_and_belongs_to_many :djs

end
