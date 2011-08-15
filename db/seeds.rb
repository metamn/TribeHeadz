require 'hpricot'

# Importing data from XML
#
# Source: editions.xml
#
# Destination: events, djs and styles tables
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
    
    puts "Creating event #{name}"
    
    n = Event.find_or_create_by_name name
    n.update_attributes :date => date, :time => time, :flyer => flyer
    n.save!
  end
  
  
  # Create new / update DJs in the database
  #
  # Also counts the poplularity of the DJ
  #
  # item - the current XML record
  #
  # Returns nothing
  def create_dj(item)
    lineup = item.at('lineup').innerHTML
    
    lineup.split(',').each do |dj|
      n = Dj.find_by_name dj
      if n.nil?
        puts "Creating DJ #{dj}"
        n = Dj.new :name => dj, :gigs => 1
      else
        puts "Updating DJ #{dj}"
        n.gigs += 1
      end
      n.save!
    end
  end
  
  
  # Create new / update music styles in the database
  #
  # Also counts the popularity of the music style
  #
  # item - the current XML record
  #
  # Returns nothing
  def create_style(item)
    music = item.at('music').innerHTML
    
    music.split(',').each do |style|
      n = Style.find_by_name style
      if n.nil?
        puts "Creating music style #{style}"
        n = Style.new :name => style, :popularity => 1
      else
        puts "Updating music style #{style}"
        n.popularity += 1
      end
      n.save!
    end
  end
  
  
  # Creating associations between Events, DJs and music Styles
  #
  # Returns nothing
  def sync
    (@editions/:edition).each do |item|
      name = item.at('name').innerHTML
      event = Event.find_by_name name
      
      puts "Connecting Events and DJs"
      lineup = item.at('lineup').innerHTML
      lineup.split(',').each do |dj|
        event.djs << Dj.find_by_name(dj)
      end
      
      puts "Connecting Events and Styles"
      styles = item.at('music').innerHTML
      styles.split(',').each do |style|
        event.styles << Style.find_by_name(style)
      end
      
      puts "Connecting DJs and Styles"
      lineup.split(',').each do |dj|
        d = Dj.find_by_name dj
        styles.split(',').each do |style|
          d.styles << Style.find_by_name(style)
        end
      end        
    end
  end
  
end





i = Import.new
i.parse
i.sync
