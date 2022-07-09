require 'rails_helper'

RSpec.describe 'submissions index' do
  it ' has submissions' do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    sub_1 = team.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    sub_2 = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)

    visit "/submissions"

    expect(page).to have_content(sub_1.title)
    expect(page).to have_content(sub_1.meat)
    expect(page).to have_content(sub_1.rub)
    expect(page).to have_content(sub_1.sauce)
    expect(page).to have_content(sub_1.cook_time)
    expect(page).to have_content(sub_1.score)
    expect(page).to have_content(sub_1.spicy)

    expect(page).to have_content(sub_2.title)
    expect(page).to have_content(sub_2.meat)
    expect(page).to have_content(sub_2.rub)
    expect(page).to have_content(sub_2.sauce)
    expect(page).to have_content(sub_2.cook_time)
    expect(page).to have_content(sub_2.score)
    expect(page).to have_content(sub_2.spicy)
  end

  it "has a link to the submissions index" do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    sub_1 = team.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    sub_2 = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)

    visit "/submissions"

    first('.submissions').click_on @submissions

    expect(current_path).to eq("/submissions")
  end


end
