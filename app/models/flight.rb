class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.search(search_params)
    where(departure_airport_id: search_params[:departure_airport_id],
          arrival_airport_id: search_params[:arrival_airport_id],
          date: search_params[:date])
  end

  def from
    departure_airport.info
  end

  def to
    arrival_airport.info
  end

  def details
    "#{time.strftime('%I:%M %p')} #{date.strftime('%Y-%m-%d')} #{from} - #{to}"
  end
end
