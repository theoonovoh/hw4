class PlacesController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    # Only show entries belonging to the current user
    @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end
end