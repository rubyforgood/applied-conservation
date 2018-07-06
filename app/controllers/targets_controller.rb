class TargetsController < ApplicationController
  before_action :load_target, only: %i[edit show update]
  before_action :load_project, only: %i[index create new edit_all update_all]

  def index
    @targets = @project.targets
  end

  def new
    @target = Target.new
  end

  def edit
    @project = @target.project
  end

  def show
    @project = @target.project
  end

  def create
    new_target = Target.new(
      target_params.merge(project_id: params[:project_id])
    )
    @target = TargetService.new(new_target).create
    if @target
      redirect_to target_path(@target)
    else
      redirect_to :new
    end
  end

  def update
    if @target.update(target_params)
      redirect_to project_targets_url(@target.project)
    else
      render :edit
    end
  end

  def edit_all
    @targets = @project.targets
  end

  def update_all
    @targets = @project.targets.index_by(&:id)

    params[:targets].each do |id, target_params|
      @targets[id.to_i].update! target_params.permit!
    end

    redirect_to [@project, :targets]
  end

  private

  def load_target
    @target = Target.find params[:id]
  end

  def load_project
    @project = Project.find params[:project_id]
  end

  def target_params
    params.require(:target)
          .permit(:name, :description, :target_type_id)
  end
end
