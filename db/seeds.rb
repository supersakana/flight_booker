# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.create(code: 'ATL', location: 'Atlanta, Georgia')
Airport.create(code: 'ORF', location: 'Norfolk, Virginia')
Airport.create(code: 'MIA', location: 'Miami, Florida')
Airport.create(code: 'LIR', location: 'Liberia, Costa Rica')

(Date.today..Date.today + 31).to_a.each do |d|
  [Time.now, Time.now + 60, Time.now - 60].each do |t|
    Flight.create(departure_airport_id: 1, arrival_airport_id: 2, date: d, time: t.strftime('%H:%M'))
    Flight.create(departure_airport_id: 2, arrival_airport_id: 3, date: d, time: t.strftime('%H:%M'))
    Flight.create(departure_airport_id: 3, arrival_airport_id: 4, date: d, time: t.strftime('%H:%M'))
    Flight.create(departure_airport_id: 4, arrival_airport_id: 1, date: d, time: t.strftime('%H:%M'))
  end
end
