require 'rails_helper'

RSpec.describe 'competition index page' do
  before :each do
    @competition1 = Competition.create!(name: "Pyre", location: "Cinderroot", sport: "Rites")
    @competition2 = Competition.create!(name: "Pyre", location: "Wakingwood", sport: "Rites")
  end

  # User Story 1 - Competition Index
  # As a user
  # When I visit the competition index
  # Then I see the names of all competitions
  # Each competition name links to its show page

  describe 'when I visit the competition' do
    it 'can see all competition names and the names link to their respective show pages' do
      visit '/competitions/'

      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition2.name)
      expect(page).to have_link("/competitions/#{@competition1.id}")
      expect(page).to have_link("/competitions/#{@competition2.id}")
    end
  end
end
