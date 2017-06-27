class TasksController < BaseUserController
  def index
    @tasks = current_user.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render action: 'new'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body).merge(user_id: current_user.id)
  end
end
