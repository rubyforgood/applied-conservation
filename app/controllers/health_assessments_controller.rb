class HealthAssessmentsController < ApplicationController
  before_action :load_health_assessment, only: %i[show edit destroy update]
  before_action :load_target, only: %i[create new]

  def update
    if @health_assessment.update(health_assessment_params)
      flash[:success] = 'Health Attribute updated'
      respond_to do |format|
        format.html do
          redirect_to target_url(@health_assessment.target)
        end
        format.json { respond_with_bip(@health_assessment) }
      end
    else
      flash[:error] = @health_assessment.errors.full_messages
      render :edit
    end
  end

  def create
    @health_assessment = HealthAssessment.new(
      health_assessment_params.merge(target_id: params[:target_id])
    )
    if @health_assessment.save
      flash[:success] = 'Health Attribute Created'
      redirect_to target_path(@target)
    else
      flash.now[:error] = @health_assessment.errors.full_messages
      render :new
    end
  end

  def new
    @health_assessment = HealthAssessment.new
    add_breadcrumb 'New Health Attribute',
                   new_target_health_assessment_path(@target)
  end

  def show; end

  def edit
    add_breadcrumb(
      'Edit',
      edit_health_assessment_path(@health_assessment)
    )
  end

  def destroy
    target = @health_assessment.target

    @health_assessment.destroy!
    flash[:success] = 'Target Deleted'
    redirect_to target_path(target)
  end

  def load_health_assessment
    @health_assessment = HealthAssessment.find params[:id]
    @target = @health_assessment.target
    @project = @target.project

    add_breadcrumb @target.name, target_path(@target)
    add_breadcrumb(
      @health_assessment.name,
      health_assessment_path(@health_assessment)
    )
  end

  def load_target
    @target = Target.find(params[:target_id])
    add_breadcrumb @target.name, target_path(@target)
    @project = @target.project
  end

  private

  def health_assessment_params
    params.require(:health_assessment)
          .permit(:rating, :name)
  end
end
