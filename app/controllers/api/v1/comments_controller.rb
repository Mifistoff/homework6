class Api::V1::CommentsController < ApplicationController
  # GET /comments
  def index
    @task = Task.find(params[:task_id])
    @comments = @task.comments.all
    render json: @comments
  end
end
