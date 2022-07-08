# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.create(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)

Submission.create(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true, team: Team.last)
Submission.create(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true, team: Team.last)
Submission.create(title: "Kings Smoked BBQ Ribs", meat: "Pork", rub: "Salt and Pepper", sauce: "kings BBQ Sauce", cook_time: 6, score: 5.5, spicy: false, team: Team.last)
Submission.create(title: "Kings Brisket", meat: "Beef", rub: "Salt and Pepper", sauce: "N/A", cook_time: 10, score: 8.5, spicy: false, team: Team.last)
