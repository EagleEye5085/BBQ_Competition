require 'rails_helper'

RSpec.describe 'Teams index' do
  it ' has teams' do
    team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)

    visit "/teams"

    expect(page).to have_content(team.name)
  end

end
