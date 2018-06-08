# frozen_string_literal: true

class TargetsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @targets = @project.targets
  end

  def new
    @project = Project.find(params[:project_id])
    @target = Target.new
  end

  def create
    @target = Target.create(target_params)

    if @target.valid?
      redirect_to projects_path(@target.project)
    else
      render :error
    end
  end

  private

  def target_params
    params.require(:target).permit(:name, :description, :target_type_id)
          .merge(project_id: params[:project_id])
  end
end
