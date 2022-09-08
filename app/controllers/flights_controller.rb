class FlightsController < ApplicationController
  def index
    @departing_options = Flight.all.map do |f|
      ["#{f.departure_airport.code}, #{f.departure_airport.location}", f.departure_airport.id]
    end
    @arriving_options = Flight.all.map do |f|
      ["#{f.arrival_airport.code}, #{f.arrival_airport.location}", f.arrival_airport.id]
    end
  end
end
