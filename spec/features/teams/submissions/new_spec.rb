require 'rails_helper'

RSpec.describe 'team submission creation' do
  before :each do
    @team = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
  end

  it 'links to the new page from the team submissions index' do

    visit "/teams/#{@team.id}/submissions"

    click_link('new submission')
    expect(current_path).to eq("/teams/#{@team.id}/submissions/new")
  end
  it 'can create a new submission' do

    visit "/teams/#{@team.id}/submissions/new"

    fill_in('Title', with: 'Kings Brisket Burnt Ends')
    fill_in('Meat', with: "Beef")
    fill_in('Rub', with: "Salt and Pepper")
    fill_in('Sauce', with: "Kings Spicy BBQ Sauce")
    fill_in('Cook time', with: 2)
    fill_in('Score', with: 7.0)
    fill_in('Spicy', with: true)

    click_button('Create Submission')

    expect(current_path).to eq("/teams/#{@team.id}/submissions")
    expect(page).to have_content('Kings Brisket Burnt Ends')
  end

end
