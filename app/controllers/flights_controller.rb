class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |airport| [airport.info, airport.id] }
    return if search_params.empty?

    @search_results = seach_flight
    @passengers = search_params[:passenger_count]
  end

  private

  def seach_flight
    if params[:date].blank?
      flash.now[:alert] = 'please input a date'
      render 'index'
    elsif params[:departure_airport_id] == params[:arrival_airport_id]
      flash.now[:alert] = 'departure and arrival flights should be different'
      render 'index'
    else
      Flight.search(search_params)
    end
  end

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :passenger_count, :date, :commit)
  end
end

# https://stackoverflow.com/questions/13227345/how-to-validate-a-search-form-in-ruby-on-rails
