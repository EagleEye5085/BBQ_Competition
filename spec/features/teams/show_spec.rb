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

    click_link("submissions")

    expect(current_path).to eq("/submissions")
  end

  it "has a link to the teams index" do

    visit "/teams/#{@kings.id}"

    click_link("teams")

    expect(current_path).to eq("/teams")
  end

  it "has a link to the team submissions index" do

    visit "/teams/#{@kings.id}"

    click_link("team submissions")

    expect(current_path).to eq("/teams/#{@kings.id}/submissions")
  end

  it 'can delete a team from the show page' do

    visit "/teams/#{@kings.id}"

    click_link "Delete #{@kings.name}"

    expect(current_path).to eq('/teams')
    expect(page).to_not have_content("King Klown BBQ")

    visit "/submissions"
    expect(page).to_not have_content("Kings Brisket Burnt Ends")
    expect(page).to_not have_content("Kings Pulled Pork")
  end

end
