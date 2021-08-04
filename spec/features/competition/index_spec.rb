require 'rails_helper'

RSpec.describe 'competition index page' do
  before :each do
    @competition1 = Competition.create!(name: "The Cinderroot Trial", location: "Cinderroot", sport: "Rites")
    @competition2 = Competition.create!(name: "The Wakingwood Trial", location: "Wakingwood", sport: "Rites")
  end

  # User Story 1 - Competition Index
  # As a user
  # When I visit the competition index x
  # Then I see the names of all competitions x
  # Each competition name links to its show page x
  describe 'when I visit the competition index' do
    it 'can see all competition names and the names link to their respective show pages' do
      visit '/competitions/'

      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition2.name)
      expect(page).to have_link("#{@competition1.name}")
      expect(page).to have_link("#{@competition2.name}")
    end
  end
end
