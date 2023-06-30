class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :search, only: :show
  before_action :searches, only: :index

  def index; end

  def create
    @search = Search.new(search_params)
    @search.origin = Place.find_or_initialize_by(search_params[:origin_attributes])
    @search.destination = Place.find_or_initialize_by(search_params[:destination_attributes])
  
    if @search.save
      flash[:success] = "Search created successfully!"
      handle_maps_data
      redirect_to @search
    else
      flash.now[:error] = @search.errors.full_messages.join("<br />")
    end
  end 

  def show
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

  def destroy
    search.destroy
    redirect_to searches_url, notice: "Search was successfully deleted"
  end

  private

  def search
    @search ||= Search.find(params[:id])
  end

  def searches
    @searches = current_user.searches.order('created_at DESC') 
  end

  def search_params
    prms = params.require(:search).permit(origin_attributes: [:title, :street, :city, :state, :zip_code], destination_attributes: [:title, :street, :city, :state, :zip_code])
    prms[:user_id] = current_user.id
    prms
  end

  def handle_maps_data
    maps_data = GoogleMapsService.new(Rails.application.credentials.google_api_key).get_directions(@search.origin.address, @search.destination.address)
    @search.update(distance: maps_data[:distance], travel_time: maps_data[:travel_time])
  end
end
