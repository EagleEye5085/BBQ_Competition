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

Team.create!(name: "Dusty Dingo BBQ", members: 6, wins: 1, last_year_winner: false)

Submission.create(title: "Dusty Brisket Burnt Ends", meat: "Beef", rub: "Desert Dust", sauce: "Dusty's Spicy BBQ Sauce", cook_time: 3, score: 5.0, spicy: true, team: Team.last)
Submission.create(title: "Dusty Pulled Pork", meat: "Pork", rub: "Desert Dust", sauce: "Dusty's Dry BBQ Sauce", cook_time: 5, score: 6.5, spicy: false, team: Team.last)
Submission.create(title: "Dusty Smoked BBQ Ribs", meat: "Pork", rub: "Garlic and pepper", sauce: "Dusty's BBQ Sauce", cook_time: 5, score: 4.5, spicy: false, team: Team.last)
Submission.create(title: "Dusty Brisket", meat: "Beef", rub: "Salt and Pepper", sauce: "Dusty's Dry BBQ Sauce", cook_time: 11, score: 8.0, spicy: false, team: Team.last)

Team.create!(name: "The Billy Bro's", members: 4, wins: 2, last_year_winner: false)

Submission.create(title: "Billy's Brisket Burnt Ends", meat: "Beef", rub: "Billy's Secret", sauce: "Billy's Spicy Rum BBQ Sauce", cook_time: 3, score: 8.0, spicy: true, team: Team.last)
Submission.create(title: "Billy's Pulled Pork", meat: "Pork", rub: "Billy's Secret", sauce: "Billy,s BBQ Sauce", cook_time: 5, score: 7.0, spicy: true, team: Team.last)
Submission.create(title: "Billy's Smoked BBQ Ribs", meat: "Pork", rub: "Billy's Secret", sauce: "Billy's Secret Sauce", cook_time: 6, score: 5.0, spicy: true, team: Team.last)
Submission.create(title: "Billy's Brisket", meat: "Beef", rub: "Billy's Secret", sauce: "N/A", cook_time: 11, score: 9.0, spicy: false, team: Team.last)
