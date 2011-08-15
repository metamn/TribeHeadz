class DjsController < ApplicationController
  
  def index
    @style = Style.find params[:style_id]
    all = @style.djs
    @djs = all.top
  end

end
