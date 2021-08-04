require 'rails_helper'

RSpec.describe 'competition show page' do
  before :each do
    @competition1 = Competition.create!(name: "The Cinder Trial", location: "Cinderroot", sport: "Liberation Rites")
    @competition2 = Competition.create!(name: "The Waking Trial", location: "Wakingwood", sport: " Liberation Rites")

    @team1 = @competition1.teams.create!(hometown: "Black Shore", nickname: "The Tempers")
    @team2 = @competition1.teams.create!(hometown: "Glade of Lu", nickname: "The Beyonders")
    @team3 = @competition1.teams.create!(hometown: "Glass Peak", nickname: "The Dissidents")
    @team4 = @competition1.teams.create!(hometown: "Underthicket", nickname: "The Essence")
    @team5 = @competition2.teams.create!(hometown: "Sulfur Mane", nickname: "The Withdrawn")

    @player1 = @team1.players.create!(name: "Ignarius", age: "102")
    @player2 = @team1.players.create!(name: "Horatio", age: "84")
    @player3 = @team1.players.create!(name: "Albus", age: "66")

    @player4 = @team2.players.create!(name: "Alva", age: "87")
    @player5 = @team2.players.create!(name: "Trea", age: "111")
    @player6 = @team2.players.create!(name: "Ygantr", age: "99")

    @player7 = @team3.players.create!(name: "Molucius", age: "88")
    @player8 = @team3.players.create!(name: "Gonti", age: "75")
    @player9 = @team3.players.create!(name: "Havar", age: "78")

    @player10 = @team4.players.create!(name: "Blemus", age: "92")
    @player11 = @team4.players.create!(name: "Harbus", age: "90")
    @player12 = @team4.players.create!(name: "Lucia", age: "115")
    @players = Player.all

  end

  # User Story 2 - Competition Show Page
  # As a user x
  # When I visit a competition's show page x
  # Then I see the competition's name, location, and sport x
  # And I see the nickname and hometown of all teams in this competition x
  # And I see the average age of all players in the competition
  describe 'when I visit the competitions show page' do
    it 'can see the competitions attributes, all teams nicknames and hometown and average age of players' do
      visit "/competitions/#{@competition1.id}"

      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition1.location)
      expect(page).to have_content(@competition1.sport)
      expect(page).to_not have_content(@competition2.name)
      expect(page).to_not have_content(@competition2.location)
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team2.nickname)
      expect(page).to have_content(@team2.hometown)
      expect(page).to have_content(@team3.nickname)
      expect(page).to have_content(@team3.hometown)
      expect(page).to have_content(@team4.nickname)
      expect(page).to have_content(@team4.hometown)
      expect(page).to_not have_content(@team5.nickname)
      expect(page).to_not have_content(@team5.hometown)
      #should this be an int? if so, in the view, i can instead do <% @average_team_age << team.players.average("age").to_i %>, but it comes out to be 90 instead of 91.
      expect(page).to have_content(@players.average("age").round(0))
    end

    # User Story 3 - Register a Team
    # As a user
    # When I visit a competition's show page x
    # Then I see a link to register a new team x
    # When I click this link x
    # Then I am taken to a new page where I see a form x
    # When I fill in this form with a team's hometown and nickname x
    # And I click submit
    # Then I am redirected back to the competition's show page
    # And I see the new team I created listed
    it 'can register a new team' do
      # team6 = @competition1.teams.create!(hometown: "Highwing Cove", nickname: "The Nightwings")

      visit "/competitions/#{@competition1.id}"

      expect(page).to have_link("Register a New Team")

      click_on "Register a New Team"
      expect(current_path).to eq("/teams/new")

      fill_in "Hometown", with: "Highwing Cove"
      fill_in "Nickname", with: "The Nightwings"
      save_and_open_page
      click_on "Submit"
      expect(current_path).to eq("/competitions/#{@competition1.id}")
      expect(page).to have_content("Highwing Cove")
      expect(page).to have_content("The Nightwings")
    end
  end
end
