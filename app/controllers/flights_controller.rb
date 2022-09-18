class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |airport| [airport.info, airport.id] }
    @search_results = Flight.search(search_params)
    @passengers = search_params[:passenger_count]
  end

  private

  # def search_flight
  #   if search_params[departure_airport_id] == search_params[arrival_airport_id]
  #     flash
  # end

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :passenger_count, :date, :commit)
  end
end
