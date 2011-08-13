# Storing music styles
class Style < ActiveRecord::Base
  validates_uniqueness_of :name
end
