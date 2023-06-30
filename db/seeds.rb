# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Place.find_or_create_by(
	title: "White House",
	street: "1600 Pennsylvania Ave NW",
	city: "Washington", 
	state: "DC",
	zip_code: "20500"
)

Place.find_or_create_by(
	title: "Lincoln Memorial",
	street: "2 Lincoln Memorial Cir NW",
	city: "Washington", 
	state: "DC",
	zip_code: "20002"
)

Search.create(
	origin: Place.first,
	destination: Place.second,
	travel_time: "9 min",
	distance: "1.5 mi"
)