class Admin::TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.status = change_status
    @task.save
    redirect_to admin_task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :body).merge(user_id: current_user.id)
  end

  def change_status
    @task.status == 'closed' ? 'active' : 'closed'
  end
end
