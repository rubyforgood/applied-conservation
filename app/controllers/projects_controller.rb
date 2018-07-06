# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :load_project, only: %i[show edit update]

  def index
    @projects = Project.all
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

    if @project.save
      redirect_to @project, notice: 'Project successfully created.'
    else
      flash.now[:error] = @project.errors.full_messages
      render :new, status: 422
    end
  end

  def edit; end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project successfully updated.'
    else
      flash.now[:error] = @project.errors.full_messages
      render :edit, status: 422
    end
  end

  private

  def load_project
    @project = Project.find(params[:id])
    add_breadcrumb 'Projects', :projects_path
    add_breadcrumb @project.name, project_path(@project)
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
