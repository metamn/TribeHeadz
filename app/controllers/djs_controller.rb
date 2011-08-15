class DjsController < ApplicationController
  
  # Displaying top DJs of a certain music style
  #
  # style_id - The ID of the music style to display
  #
  # Returns a collection of DJs
  def index
    @style = Style.find params[:style_id]
    all = @style.djs
    @djs = all.top
  end

end
