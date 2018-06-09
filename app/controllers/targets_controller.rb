# frozen_string_literal: true

class TargetsController < ApplicationController
  def index
    @targets = project.targets
  end

  def new
    @target = Target.new
  end

  def create
    @target = project.targets.new(target_params)

    if @target.save
      redirect_to project_targets_path(@target.project)
    else
      redirect_to :new
    end
  end

  private

  helper_method def project
    @project ||= Project.find(params[:project_id])
  end

  def target_params
    params.require(:target).permit(:name, :description, :target_type_id)
  end
end
