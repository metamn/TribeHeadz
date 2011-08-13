# Storing DJs
class Dj < ActiveRecord::Base
  validates_uniqueness_of :name
  
  def self.top
    []
  end
end
