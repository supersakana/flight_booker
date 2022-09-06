class FlightsController < ApplicationController
  def index
    @departing_options = Flight.all.map { |f| "#{f.departure_airport.code}, #{f.departure_airport.location}" }
    @arriving_options = Flight.all.map { |f| "#{f.arrival_airport.code}, #{f.arrival_airport.location}" }
  end
end
2
