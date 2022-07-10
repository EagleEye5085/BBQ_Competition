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
    team = Team.create(team_params)
    redirect_to "/teams"
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)

    redirect_to "/teams/#{team.id}"
  end

private
  def team_params
    params.permit(:name, :members, :wins, :last_year_winner)
  end

end
