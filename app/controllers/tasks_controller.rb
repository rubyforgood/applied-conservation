# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :load_task, only: %i[edit show update]
  before_action :load_project, only: %i[index create new]

  def new
    @task = @project.tasks.new
    @users = User.all
  end

  def create
    @task = @project.tasks.new(task_params)
    @task.status = 'New'
    if @task.save
      redirect_to @task.project
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task.project
    else
      render 'edit'
    end
  end

  def pickup
    @task = Task.find(params[:task_id])
    if @task.update(user: current_user, status: 'In Progress')
      redirect_to @task.project
    else
      render 'edit'
    end
  end

  def done
    @task = Task.find(params[:task_id])
    if @task.update(status: 'Done')
      redirect_to @task.project
    else
      render 'edit'
    end
  end

  def archive
    @task = Task.find(params[:task_id])
    if @task.update(status: 'Archived')
      redirect_to @task.project
    else
      render 'edit'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description,
                                 :due_on, :project_id, :user_id)
  end

  def load_task
    @task = Task.find params[:id]
  end

  def load_project
    @project = Project.find params[:project_id]
  end
end
