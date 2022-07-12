require 'rails_helper'

RSpec.describe 'submissions index' do
  before :each do
    @kings = Team.create!(name: "King Klown BBQ", members: 5, wins: 3, last_year_winner: true)
    @brisket = @kings.submissions.create!(title: "Kings Brisket Burnt Ends", meat: "Beef", rub: "Salt and Pepper", sauce: "Kings Spicy BBQ Sauce", cook_time: 2, score: 7.0, spicy: true)
    @pulled_pork = @kings.submissions.create!(title: "Kings Pulled Pork", meat: "Pork", rub: "Kings Pork Bark", sauce: "Kings Sweet BBQ Sauce", cook_time: 6, score: 6.0, spicy: false)

      visit "/submissions"
  end

  it ' has submissions' do

    expect(page).to have_content(@brisket.title)
    expect(page).to have_content(@brisket.meat)
    expect(page).to have_content(@brisket.rub)
    expect(page).to have_content(@brisket.sauce)
    expect(page).to have_content(@brisket.cook_time)
    expect(page).to have_content(@brisket.score)
    expect(page).to have_content(@brisket.spicy)

  end

  it "has a link to the submissions index" do

    click_link("submissions")

    expect(current_path).to eq("/submissions")
  end

  it "has a link to the teams index" do

    click_link("teams")

    expect(current_path).to eq("/teams")
  end

  it 'only displays spicy submissions' do

    expect(page).to have_content("Kings Brisket Burnt Ends")
    expect(page).to_not have_content("Kings Pulled Pork")
  end

  it 'can edit the submission' do

    click_button "Edit #{@brisket.title}"

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
