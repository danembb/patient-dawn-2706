class CompetitionsController < ApplicationController

  def index
    @competition = Competition.all
  end
end
