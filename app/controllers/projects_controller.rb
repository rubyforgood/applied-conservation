# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end

  def show
    @tasks = @project.tasks.reject do |task|
      task.status == 'Archived'
    end
  end

  def new; end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project successfully updated.'
    else
      flash.now[:error] = @project.errors.full_messages
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
