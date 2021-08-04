require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:team_competitions) }
    it { should have_many(:competitions).through(:team_competitions) }
  end
end
