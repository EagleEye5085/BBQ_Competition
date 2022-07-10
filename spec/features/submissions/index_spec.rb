require 'rails_helper'

RSpec.describe 'submissions index' do
  before :each do
    @kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    @brisket = @kings.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    @pulled_pork = @kings.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)
  end

  it ' has submissions' do


    visit "/submissions"

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

  it "has a link to the submissions index" do

    visit "/submissions"

    click_link("submissions")

    expect(current_path).to eq("/submissions")
  end

  it "has a link to the teams index" do

    visit "/submissions"

    click_link("teams")

    expect(current_path).to eq("/teams")
  end


end
