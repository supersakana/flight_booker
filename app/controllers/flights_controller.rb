class FlightsController < ApplicationController
  def index
    @departing_options = Flight.all.map { |f| [f.from, f.departure_airport.id] }
    @arriving_options = Flight.all.map { |f| [f.to, f.arrival_airport.id] }
    @search_results = Flight.search(search_params)
    @passengers = search_params[:passenger_count]
  end

  private

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :passenger_count, :date, :commit)
  end
end
