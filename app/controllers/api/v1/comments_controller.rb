class Api::V1::CommentsController < ApplicationController
  # GET /comments
  def index
    @task = Task.find(params[:task_id])
    @comments = @task.comments.all
    render json: @comments
  end

  # POST /comments
  def create
    @comment = Comment.create!(comment_params)
    render json: @comment, status: :created
  end

  # GET /comments/:id
  def show
    render json: @comment
  end

  private

  def comment_params
    # whitelist params
    params.permit(:body).merge(commentator: current_user)
  end
end
