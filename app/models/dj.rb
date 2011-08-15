# Storing DJs
class Dj < ActiveRecord::Base
  validates_uniqueness_of :name
  
  has_and_belongs_to_many :styles
  has_and_belongs_to_many :events
  
  def self.top
    limit(10)
  end
end
