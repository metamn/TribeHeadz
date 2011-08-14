class HomeController < ApplicationController
  def index
    @top = Style.top.map {|s| s.name }
  end

end
