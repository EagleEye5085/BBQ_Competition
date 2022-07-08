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

end
