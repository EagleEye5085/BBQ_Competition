class TeamSubmissionsController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @submissions = @team.submissions
  end

  def new
  end

  def create
    @team = Team.find(params[:team_id])
    submission = @team.submissions.create!(submission_params)
    redirect_to "/teams/#{params[:team_id]}/submissions"
  end

private
  def submission_params
    params.permit(:title, :meat, :rub, :sauce, :cook_time, :score, :spicy)
  end

end
