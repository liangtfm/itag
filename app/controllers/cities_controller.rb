class CitiesController < ApplicationController

  def index
    @cities = City.includes(:state).all
  end

  def show

  end

end
