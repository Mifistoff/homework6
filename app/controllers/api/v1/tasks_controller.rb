class Api::V1::TasksController < ApplicationController
  # GET /tasks
  def index
    @tasks = Task.all
    render json: @tasks
  end

  # GET /tasks/:id
  def show
    @task = Task.find(params[:id])
    render json: @task
  end
end
