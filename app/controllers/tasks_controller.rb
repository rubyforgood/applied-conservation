class TasksController < ApplicationController
  before_action :get_project, only: [:new, :create]

  def new
    @task = @project.tasks.new
    @users = User.all
  end    

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to @task.project
    else
      render @task
    end  
  end  

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_on, :project_id, :user_id)
  end
  
  def get_project
    @project = Project.find(params[:project_id])
  end
end


