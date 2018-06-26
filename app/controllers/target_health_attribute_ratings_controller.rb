class TargetHealthAttributeRatingsController < ApplicationController
  def update
    @target_health_attribute_rating = TargetHealthAttributeRating.find(params[:id])
    @target_health_attribute_rating.update(target_health_attribute_rating_params)

    target = @target_health_attribute_rating.target
    respond_to do |format|
      format.html { redirect_to project_target_url(target.project, target) }
      format.json { respond_with_bip(@target_health_attribute_rating) }
    end
  end

  private

  def target_health_attribute_rating_params
    params.require(:target_health_attribute_rating)
          .permit(:rating)
  end
end