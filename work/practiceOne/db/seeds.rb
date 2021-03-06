# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create(
	name: "Bob Bobbert",
	email: "bob@example.com",
	screenname: "bobbob"
)

User.create(
	name: "Ted Teddy",
	email: "ted@example.com",
	screenname: "tedted"
)

User.create(
	name: "Alice Ali",
	email: "alice@example.com",
	screenname: "aliali"
)

User.create(
	name: "Sam Samsom",
	email: "sam@gmail.com",
	screenname: "samsam"
)

User.create(
	name: "Peter Parker",
	email: "peter@gmail.com",
	screenname: "spiderman"
)