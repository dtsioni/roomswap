class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def index
    @locations = Location.all
  end

  def create
    @location = Location.new(location_params)
    @location.university = University.default
    respond_to do |format|
      if @location.save
      else
      end
    end
  end

  def destroy
    @location.destroy
  end

  private

    def user_params
      params.require(:location).permit(:campus, :floor, :building)
    end
end