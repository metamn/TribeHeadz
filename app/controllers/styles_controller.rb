class StylesController < ApplicationController
  
  # Displaying top music styles
  #
  # Returns a collection of styles
  def index
    @top = Style.top
  end

end
