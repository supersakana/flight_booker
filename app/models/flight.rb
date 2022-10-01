class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.search(search_params)
    where(['datetime LIKE ? and departure_airport_id = ? and arrival_airport_id = ?',
           "#{search_params[:date]}%", search_params[:departure_airport_id], search_params[:arrival_airport_id]])
  end

  def from
    departure_airport.info
  end

  def to
    arrival_airport.info
  end

  def details
    "#{datetime.strftime('%I:%M %p')} #{datetime.strftime('%Y-%m-%d')} #{from} - #{to}"
  end
end
