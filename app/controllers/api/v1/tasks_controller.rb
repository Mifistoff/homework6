class Api::V1::TasksController < ApplicationController
  # GET /tasks
  def index
    @tasks = Task.all
    render json: @tasks
  end

  # POST /tasks
  def create
    @task = Task.create!(task_params)
    render json: @task, status: :created
  end

  # GET /tasks/:id
  def show
    render json: @task
  end

  private

  def task_params
    # whitelist params
    params.permit(:title, :body).merge(user_id: current_user.id)
  end
end
end
