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
    expect(page).to have_content(@pulled_pork.title)
  end

  it 'links to each submission show page' do
    visit "/teams/#{@kings.id}/submissions"

    click_on @brisket.title

    expect(current_path).to eq("/submissions/#{@brisket.id}")
  end

end
