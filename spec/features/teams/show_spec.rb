require 'rails_helper'

RSpec.describe 'Teams show' do
  before :each do
    @kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    @brisket = @kings.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    @pulled_pork = @kings.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)
  end

  it ' has teams info' do

    visit "/teams/#{@kings.id}"

    expect(page).to have_content(@kings.name)
    expect(page).to have_content(@kings.members)
    expect(page).to have_content(@kings.wins)
    expect(page).to have_content(@kings.last_year_winner)
  end

  it 'shows the number of submissions' do

    visit "/teams/#{@kings.id}"

    expect(page).to have_content("Team submission count: 2")
  end

  it "has a link to the submissions index" do

    visit "/teams/#{@kings.id}"

    first('.submissions').click_on @submissions

    expect(current_path).to eq("/submissions")
  end

  it "has a link to the teams index" do

    visit "/teams/#{@kings.id}"

    first('.teams').click_on @teams

    expect(current_path).to eq("/teams")
  end

end
