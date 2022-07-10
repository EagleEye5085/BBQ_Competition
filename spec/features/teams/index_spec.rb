require 'rails_helper'

RSpec.describe 'Teams index' do
  before :each do
    @kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    @brisket = @kings.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    @pulled_pork = @kings.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)
  end

  it ' has teams' do

    visit "/teams"

    expect(page).to have_content(@kings.name)
  end

  it 'lists by orderof creation new to old' do
    Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    Team.create!(name: "Dusty Dingo BBQ", members: 6, wins: 1, last_year_winner: false)
    Team.create!(name: "The Billy Bro's", members: 4, wins: 2, last_year_winner: false)

    visit "/teams"

    within '#team-0' do
      expect(page).to have_content("The Billy Bro's")
    end

    within '#team-1' do
      expect(page).to have_content("Dusty Dingo BBQ")
    end

    within '#team-2' do
      expect(page).to have_content("King Klown BBQ")
    end
  end

  it "has a link to the submissions index" do


    visit "/teams"

    first('.submissions').click_on "submissions"

    expect(current_path).to eq("/submissions")
  end

  it "has a link to the teams index" do

    visit "/teams"

    first('.teams').click_on "teams"

    expect(current_path).to eq("/teams")
  end

end
