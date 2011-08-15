class EventsController < ApplicationController
  
  
  def index
    @dj = Dj.find params[:dj_id]
    @style = Style.find params[:style]
    @events = @dj.events
  end

  def show
    @event = Event.find params[:id]
  end

end
