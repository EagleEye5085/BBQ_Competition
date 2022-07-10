class TeamsController < ApplicationController

  def index
    @teams = Team.order(created_at: :desc)
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    team = Team.create(name: params[:name],members: params[:members],wins: params[:wins],last_year_winner: params[:last_year_winner])

    redirect_to "/teams"
  end

end
