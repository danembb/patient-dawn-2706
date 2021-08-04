class CompetitionsController < ApplicationController

  def index
    @competitions = Competition.all
  end

  def show
    @competitions = Competition.find(params[:id])
  end
end
