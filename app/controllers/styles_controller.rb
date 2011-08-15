class StylesController < ApplicationController
  
  def index
    @top = Style.top
  end

end
