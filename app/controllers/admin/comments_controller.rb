class Admin::CommentsController < BaseControllers::BaseAdminController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create!(comment_params)
    if @task.admin_id.nil?
      @task.admin_id = current_admin.id
      @task.save
    end
    redirect_to admin_task_path(@task)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(commentator: current_admin)
  end
end
