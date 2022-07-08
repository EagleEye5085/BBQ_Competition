require 'rails_helper'

RSpec.describe 'the submissions show page' do
  it 'displayes the submission title' do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    submission = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0)
    visit "/submissions/#{submission.id}"

    expect(page).to have_content(submission.title)
  end

  it 'displays the name of the team for the submission' do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    submission = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0)
    visit "/submissions/#{submission.id}"

    expect(page).to have_content(team.name)
  end

end
