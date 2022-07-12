require 'rails_helper'

RSpec.describe 'deleting a team' do
  it 'can delete a team from the show page' do
    @kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    @brisket = @kings.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    @pulled_pork = @kings.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)

    visit "/teams/#{@kings.id}"

    click_link "Delete #{@kings.name}"

    expect(current_path).to eq('/teams')
    expect(page).to_not have_content("King Klown BBQ")

    visit "/submissions"
    expect(page).to_not have_content("Kings Brisket Burnt Ends")
    expect(page).to_not have_content("Kings Pulled Pork")
  end
end
