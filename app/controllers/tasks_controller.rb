class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id: current_user.id).all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
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
    if @task.update(task_params)
      redirect_to [:edit, @task]
    else
      render action: 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to :tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :body).merge(user_id: current_user.id)
  end
end
