class EventsController < ApplicationController
  
  # Displaying all events of a DJ
  #
  # style - The ID of the music style the DJ performs on the event
  # dj_id - The ID of the DJ
  #
  # Returns a collection of events
  def index
    @dj = Dj.find params[:dj_id]
    @style = Style.find params[:style]
    @events = @dj.events
  end

  def show
    @event = Event.find params[:id]
  end

end
