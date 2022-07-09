require 'rails_helper'

RSpec.describe 'Teams show' do
  it ' has teams info' do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)

    visit "/teams/#{team.id}"

    expect(page).to have_content(team.name)
    expect(page).to have_content(team.members)
    expect(page).to have_content(team.wins)
    expect(page).to have_content(team.last_year_winner)
  end

  it 'shows the number of submissions' do
    team = Team.create(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)

    Submission.create(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true, team: Team.last)
    Submission.create(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true, team: Team.last)
    Submission.create(title: "Kings Smoked BBQ Ribs", meat: "Pork", rub: "Salt and Pepper", sauce: "kings BBQ Sauce", cook_time: 6, score: 5.5, spicy: false, team: Team.last)
    Submission.create(title: "Kings Brisket", meat: "Beef", rub: "Salt and Pepper", sauce: "N/A", cook_time: 10, score: 8.5, spicy: false, team: Team.last)

    visit "/teams/#{team.id}"

    expect(page).to have_content("Team submission count: 4")
  end

  it "has a link to the submissions index" do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    sub_1 = team.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    sub_2 = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)

    visit "/teams/#{team.id}"

    first('.submissions').click_on @submissions

    expect(current_path).to eq("/submissions")
  end

end
