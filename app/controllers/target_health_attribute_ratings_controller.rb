class TargetHealthAttributeRatingsController < ApplicationController
  def update
    @target_health_attribute_rating = TargetHealthAttributeRating
                                      .find(params[:id])
    @target_health_attribute_rating.update(
      target_health_attribute_rating_params
    )

    respond_to do |format|
      format.html do
        redirect_to target_url(@target_health_attribute_rating.target)
      end
      format.json { respond_with_bip(@target_health_attribute_rating) }
    end
  end

  private

  def target_health_attribute_rating_params
    params.require(:target_health_attribute_rating)
          .permit(:rating)
  end
end
