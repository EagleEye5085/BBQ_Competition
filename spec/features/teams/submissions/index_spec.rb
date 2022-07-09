require 'rails_helper'

RSpec.describe 'Teams submissions index' do
  before :each do
    @kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    @brisket = @kings.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    @pulled_pork = @kings.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)
  end

  it 'shows all of the titles of the submissions for the team' do
    visit "/teams/#{@kings.id}/submissions"

    expect(page).to have_content(@brisket.title)
    expect(page).to have_content(@brisket.meat)
    expect(page).to have_content(@brisket.rub)
    expect(page).to have_content(@brisket.sauce)
    expect(page).to have_content(@brisket.cook_time)
    expect(page).to have_content(@brisket.score)
    expect(page).to have_content(@brisket.spicy)
    expect(page).to have_content(@pulled_pork.title)
    expect(page).to have_content(@pulled_pork.meat)
    expect(page).to have_content(@pulled_pork.rub)
    expect(page).to have_content(@pulled_pork.sauce)
    expect(page).to have_content(@pulled_pork.cook_time)
    expect(page).to have_content(@pulled_pork.score)
    expect(page).to have_content(@pulled_pork.spicy)
  end

  it 'links to each submission show page' do
    visit "/teams/#{@kings.id}/submissions"

    click_on @brisket.title

    expect(current_path).to eq("/submissions/#{@brisket.id}")
  end

  it "has a link to the submissions index" do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    sub_1 = team.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    sub_2 = team.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)

    visit "/teams/#{team.id}/submissions"

    first('.submissions').click_on @submissions

    expect(current_path).to eq("/submissions")
  end

end
