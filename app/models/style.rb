# Storing music styles
class Style < ActiveRecord::Base
  validates_uniqueness_of :name
  
  has_and_belongs_to_many :djs
  has_and_belongs_to_many :events
  
  
  # Getting the top 10 music styles based on popularity
  #
  # Returns a set of 10 records
  def self.top
    self.order("popularity DESC").limit(10)
  end
end
