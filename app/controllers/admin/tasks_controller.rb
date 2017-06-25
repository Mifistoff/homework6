class Admin::TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render action: 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.status = change_status
    @task.save
    redirect_to admin_task_path
  end

  def destroy
    @task.destroy
    redirect_to :tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :body).merge(user_id: current_user.id)
  end

  def change_status
    @task.status == 'closed' ? 'active' : 'closed'
  end
end
