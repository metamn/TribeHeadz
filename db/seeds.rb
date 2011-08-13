require 'hpricot'

# Importing data from XML
#
# Source: editions.xml
class Import

  # Load the XML file
  #
  # Returns nothing
  def initialize
    @editions = Hpricot::XML(open('db/editions.xml'))
  end
  
  
  # Parse the XML file
  #
  # Looping through all the XML records and adding them to the database
  #
  # Returns nothing
  def parse
    (@editions/:edition).each do |item|
      
      create_event item
      create_dj item  
      create_style item
    end
  end
  
  
  # Create a new Event in the database
  #
  # item - the current XML record
  #
  # Returns nothing
  def create_event(item)
    name = item.at('name').innerHTML
    date = item.at('date').innerHTML
    time = item.at('time').innerHTML
    flyer = item.at('image_flyer_front').innerHTML
    
    n = Event.find_or_create_by_name name
    n.update_attributes :date => date, :time => time, :flyer => flyer
    n.save!
  end
  
  
  # Create new DJs in the database
  #
  # item - the current XML record
  #
  # Returns nothing
  def create_dj(item)
    lineup = item.at('lineup').innerHTML
    
    lineup.split(',').each do |dj|
      n = Dj.find_or_create_by_name dj
      n.save!
    end
  end
  
  
  # Create new music styles in the database
  #
  # item - the current XML record
  #
  # Returns nothing
  def create_style(item)
    music = item.at('music').innerHTML
    
    music.split(',').each do |style|
      n = Style.find_or_create_by_name style
      n.save!
    end
  end
end


i = Import.new
i.parse
