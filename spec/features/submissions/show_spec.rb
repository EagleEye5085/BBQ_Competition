require 'rails_helper'

RSpec.describe 'the submissions show page' do
  it 'displayes the submission title' do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    submission = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0)
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
    submission = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0)
    visit "/submissions/#{submission.id}"

    expect(page).to have_content(team.name)
  end

end
