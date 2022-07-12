require 'rails_helper'

RSpec.describe 'Teams submissions index' do
  before :each do
    @kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    @pulled_pork = @kings.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: true)
    @brisket = @kings.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)

    visit "/teams/#{@kings.id}/submissions"
  end

  it 'shows all of the titles of the submissions for the team' do

    expect(page).to have_content(@pulled_pork.title)
    expect(page).to have_content(@pulled_pork.meat)
    expect(page).to have_content(@pulled_pork.rub)
    expect(page).to have_content(@pulled_pork.sauce)
    expect(page).to have_content(@pulled_pork.cook_time)
    expect(page).to have_content(@pulled_pork.score)
    expect(page).to have_content(@pulled_pork.spicy)

    expect(page).to have_content(@brisket.title)
    expect(page).to have_content(@brisket.meat)
    expect(page).to have_content(@brisket.rub)
    expect(page).to have_content(@brisket.sauce)
    expect(page).to have_content(@brisket.cook_time)
    expect(page).to have_content(@brisket.score)
    expect(page).to have_content(@brisket.spicy)
  end

  it 'links to each submission show page' do

    click_on @brisket.title

    expect(current_path).to eq("/submissions/#{@brisket.id}")
  end

  it "has a link to the submissions index" do

    click_link("submissions")

    expect(current_path).to eq("/submissions")
  end

  it "has a link to the teams index" do


    click_link("teams")

    expect(current_path).to eq("/teams")
  end

  it 'lists by Alphabetical Order by name' do

    click_link("Sort submissions by title")

    expect(current_path).to eq("/teams/#{@kings.id}/submissions")

    within '#submission-0' do
      expect(page).to have_content("Kings Brisket Burnt Ends")
    end

    within '#submission-1' do
      expect(page).to have_content("Kings Pulled Pork")
    end
  end

  it 'displays records over a given threshold' do

    fill_in('Score filter', with: 6.5)

    click_button "Filter"

    expect(current_path).to eq("/teams/#{@kings.id}/submissions")
    expect(page).to have_content("Kings Brisket Burnt Ends")
    expect(page).to_not have_content("Kings Pulled Pork")
  end

  it 'can delete a team from the index page' do

    click_link "Delete #{@brisket.title}"

    expect(current_path).to eq('/submissions')
    expect(page).to_not have_content("Kings Brisket Burnt Ends")
  end

end
