# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :load_project, only: %i[show edit update]

  def index
    @projects = policy_scope(Project)
  end

  def show
    @tasks = @project.tasks.reject do |task|
      task.status == 'Archived'
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.users << current_user

    if @project.save
      flash[:notice] = 'Project created'
      redirect_to @project
    else
      flash.now[:alert] = @project.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @project.update_attributes(project_params)
      flash[:notice] = 'Project updated'
      redirect_to @project
    else
      flash.now[:alert] = @project.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def load_project
  begin
    @project = policy_scope(Project).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'You\'re not allowed to access this project'
    return redirect_to projects_path
  end

    add_breadcrumb 'Projects', :projects_path
    add_breadcrumb @project.name, project_path(@project)
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
