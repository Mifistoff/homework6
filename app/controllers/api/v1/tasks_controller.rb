class Api::V1::TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to :tasks
    else
      render action: 'new'
    end
  end
  
  private

  def task_params
    params.require(:task).permit(
    :name,
    :body,
    :user_id,
    :admin_id,
    :status
    )
  end
end
