class TripPackagesController < ApplicationController
  before_action :find_package


  include TripPackagesHelper


  def find_package
    @package = Package.find(params[:id])
  end

  def create
    @trip.add_package(@package.id)

    session[:trip] = @trip.itinerary
    flash[:notice] = "You have added #{@package.title} to your trip. Your current trip costs: #{@trip.total_price}."
    redirect_to package_path(@package)
  end

   def show
    # unless itinerary.nil?
    #   @packages = itinerary.keys.map do |id|
    #     Package.find(id)
    #   end
    # end
  end

  def update
    if params[:operation] == "+"
      increment_quantity(params[:id])
    else
      decrement_quantity(params[:id])
    end
    redirect_to '/trip'
  end


  def destroy
    itinerary = session[:trip]
    itinerary.delete(params[:id])
    flash[:delete_package] = "Successfully removed #{@package.title} from your trip"
    redirect_to "/trip"
  end

end

class TripPackages

  attr_accessor :packages

  def initialize(package_id, itinerary)
    @packages = Package.find_by
  end

end
