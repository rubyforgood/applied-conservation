class HealthAssessmentsController < ApplicationController
  before_action :load_health_assessment, only: %i[show edit]

  def update
    @target_health_attr_rating = HealthAssessment
                                 .find(params[:id])
    @target_health_attr_rating.update(
      health_assessment_params
    )

    respond_to do |format|
      format.html do
        redirect_to target_url(@target_health_attr_rating.target)
      end
      format.json { respond_with_bip(@target_health_attr_rating) }
    end
  end

  def show; end

  def edit
    add_breadcrumb(
      'Edit',
      edit_health_assessment_path(@target_health_attr_rating)
    )
  end

  def load_health_assessment
    @target_health_attr_rating = HealthAssessment.find params[:id]
    @target = @target_health_attr_rating.target
    @project = @target.project

    add_breadcrumb @target.name, target_path(@target)
    add_breadcrumb(
      @target_health_attr_rating.name,
      health_assessment_path(@target_health_attr_rating)
    )
  end

  private

  def health_assessment_params
    params.require(:health_assessment)
          .permit(:rating, :name)
  end
end
