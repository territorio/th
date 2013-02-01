class PlacesController < ApplicationController
  respond_to :json

  def index
    respond_with(@places = Place.all)
  end

  def show
    respond_with(@place = Place.find(params[:id]))
  end

end
