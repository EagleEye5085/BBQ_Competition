require 'rails_helper'

RSpec.describe 'the submissions show page' do
  it 'displayes the submission title' do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    submission = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)
    visit "/submissions/#{submission.id}"

    expect(page).to have_content(submission.title)
    expect(page).to have_content(submission.meat)
    expect(page).to have_content(submission.rub)
    expect(page).to have_content(submission.sauce)
    expect(page).to have_content(submission.cook_time)
    expect(page).to have_content(submission.score)
    expect(page).to have_content(submission.spicy)
  end

  it 'displays the name of the team for the submission' do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    submission = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)
    visit "/submissions/#{submission.id}"

    expect(page).to have_content(team.name)
  end

  it "has a link to the submissions index" do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    sub_1 = team.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    sub_2 = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)

    visit "/submissions/#{sub_1.id}"

    first('.submissions').click_on @submissions

    expect(current_path).to eq("/submissions")
  end

end
