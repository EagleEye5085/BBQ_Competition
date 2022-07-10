require 'rails_helper'

RSpec.describe 'the team creation' do

  it 'links to the new page from the teams index' do
    visit '/teams'

    click_link('new team')
    expect(current_path).to eq('/teams/new')
  end

  it 'can create a new team' do
    visit '/teams/new'

    fill_in('Name', with: 'King Klownz BBQ')
    fill_in('Members', with: 6)
    fill_in('Wins', with: 3)
    fill_in('Last year winner', with: true)

    click_button('Create Team')

    expect(current_path).to eq("/teams")
    expect(page).to have_content('King Klownz BBQ')
  end

end
