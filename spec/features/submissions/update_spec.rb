require 'rails_helper'

RSpec.describe 'the submission update' do
  before :each do
    @kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    @brisket = @kings.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)

    visit "/submissions/#{@brisket.id}"

    click_button "Edit #{@brisket.title}"
  end

  it 'links to the update page' do

    expect(current_path).to eq("/submissions/#{@brisket.id}/edit")
  end

  it 'can edit the submission' do

    fill_in('Title', with: 'Kings Brisket Burnt Ends')
    fill_in('Meat', with: "Beef")
    fill_in('Rub', with: "Salt and Pepper")
    fill_in('Sauce', with: "Kings Spicy BBQ Sauce")
    fill_in('Cook time', with: 2)
    fill_in('Score', with: 7.0)
    fill_in('Spicy', with: true)
    click_button 'Update Submission'

    expect(current_path).to eq("/submissions/#{@brisket.id}")
    expect(page).to have_content('Kings Brisket Burnt Ends')
  end

end
