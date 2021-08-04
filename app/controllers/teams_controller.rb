class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @competition = Competition.find(params[:id])
    @team = Team.create(hometown: params[:hometown], nickname: params[:nickname])
    redirect_to "/competitions/#{@competition.id}"
  end
end
