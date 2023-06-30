class SearchesController < ApplicationController
  def index
    @searches = Search.order('created_at DESC')
  end

  # todo: have to call google maps service and handle distance and travel time
  def create
    @search = Search.new(search_params)
    @search.origin = Place.new(search_params[:origin_attributes])
    @search.destination = Place.new(search_params[:destination_attributes])
  
    if @search.save
      flash[:success] = "Search created successfully!"
      handle_maps_data
      redirect_to @search
    else
      flash.now[:error] = @search.errors.full_messages.join("<br />")
      # render :new, status: 422
    end
  end 

  def show
    @search = Search.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: [@search.origin.address, @search.destination.address] }
    end
  end

  def new
    @search = Search.new
    @search.origin = Place.new
    @search.destination = Place.new
  end

  private

  def search_params
    params.require(:search).permit(origin_attributes: [:title, :street, :city, :state, :zip_code], destination_attributes: [:title, :street, :city, :state, :zip_code])
  end

  def handle_maps_data
    maps_data = GoogleMapsService.new(Rails.application.credentials.google_api_key).get_directions(@search.origin.address, @search.destination.address)
    @search.update(distance: maps_data[:distance], travel_time: maps_data[:travel_time])
  end
end
