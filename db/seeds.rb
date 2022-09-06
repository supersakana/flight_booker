# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.create(code: 'ATL', location: 'Atlanta, Georgia')
Airport.create(code: 'DFW', location: 'Dallas, Texas')
Airport.create(code: 'DEN', location: 'Denver, Colorado')
Airport.create(code: 'ORF', location: 'Norfolk, Virginia')
Airport.create(code: 'MIA', location: 'Miami, Florida')
Airport.create(code: 'LIR', location: 'Liberia, Costa Rica')

Flight.create(departure_airport_id: 1, arrival_airport_id: 2)
Flight.create(departure_airport_id: 3, arrival_airport_id: 4)
Flight.create(departure_airport_id: 5, arrival_airport_id: 6)
