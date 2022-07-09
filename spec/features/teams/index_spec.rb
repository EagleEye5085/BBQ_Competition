require 'rails_helper'

RSpec.describe 'Teams index' do
  it ' has teams' do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)

    visit "/teams"

    expect(page).to have_content(team.name)
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





end
