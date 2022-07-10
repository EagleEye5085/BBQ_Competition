require 'rails_helper'

RSpec.describe 'the team update' do
  it 'links to the update page' do
    kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)

    visit '/teams'

    click_button "Edit #{kings.name}"

    expect(current_path).to eq("/teams/#{kings.id}/edit")
  end

  it 'can edit the artist' do
    kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)

    visit '/teams'

    click_button "Edit #{kings.name}"

    fill_in 'Name', with: 'King Clown BBQ'
    fill_in 'Members', with: 3
    fill_in 'Wins', with: 1
    fill_in 'Last year winner', with: false
    click_button 'Update Team'

    expect(current_path).to eq("/teams/#{kings.id}")
    expect(page).to have_content('King Clown BBQ')
  end

end
