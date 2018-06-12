class TargetsController < ApplicationController
  before_action :load_project

  def index
    @targets = @project.targets
  end

  def new
    @target = Target.new
  end

  def edit
    @target = Target.find(params[:id])
  end

  def show
    @target = Target.find(params[:id])
    @health_attributes = @target.target_health_attribute_ratings
                                .map(&:health_attribute)
  end

  def create
    new_target = Target.new(target_params)
    @target = TargetService.new(new_target).create
    if @target
      redirect_to project_target_path(@target.project, @target)
    else
      redirect_to :new
    end
  end

  def update
    @target = Target.find(params[:id])

    if @target.update(target_params)
      redirect_to project_targets_url(@target.project)
    else
      render :edit
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def target_params
    params.require(:target)
          .permit(:name, :description, :target_type_id)
          .merge(project_id: params[:project_id])
  end
end
