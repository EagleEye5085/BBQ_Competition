class SubmissionsController < ApplicationController

  def index
    @submissions = Submission.all.find_all do |submission|
      submission.spicy == true
    end
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    submission = Submission.find(params[:id])
    submission.update(submission_params)

    redirect_to "/submissions/#{submission.id}"
  end

  private
    def submission_params
      params.permit(:title, :meat, :rub, :sauce, :cook_time, :score, :spicy)
    end

end
