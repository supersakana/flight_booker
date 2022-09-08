class FlightsController < ApplicationController
  def index
    @departing_options = Flight.all.map do |f|
      [f.from, f.departure_airport.id]
    end
    @arriving_options = Flight.all.map do |f|
      [f.to, f.arrival_airport.id]
    end
    @search_results = Flight.search(search_params)
  end

  private

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id)
  end
end
