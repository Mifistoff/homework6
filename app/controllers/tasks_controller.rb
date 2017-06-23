class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to :tasks
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
    params.require(:task).permit(
    :name,
    :body,
    :user_id,
    :admin_id,
    :status
    )
  end
end
