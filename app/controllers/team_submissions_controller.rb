class TeamSubmissionsController < ApplicationController
  def index
    team = Team.find(params[:team_id])
    @submissions = team.submissions
  end
end
