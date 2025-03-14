class EntriesController < ApplicationController
  before_action :authenticate_user

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = @current_user["id"]  # Associate the entry with the current user
    
    if params["image"].present?
      @entry.image.attach(params["image"])
    end
    
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end
end