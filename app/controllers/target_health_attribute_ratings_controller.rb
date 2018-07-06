class TargetHealthAttributeRatingsController < ApplicationController
  before_action :load_target_health_attribute_rating, only: %i[show edit]
  def update
    @target_health_attr_rating = TargetHealthAttributeRating
                                 .find(params[:id])
    @target_health_attr_rating.update(
      target_health_attribute_rating_params
    )

    respond_to do |format|
      format.html do
        redirect_to target_url(@target_health_attr_rating.target)
      end
      format.json { respond_with_bip(@target_health_attr_rating) }
    end
  end

  def show
    @target = @target_health_attr_rating.target
    @project = @target.project
  end

  def edit
    @target = @target_health_attr_rating.target
    @project = @target.project
  end

  def load_target_health_attribute_rating
    @target_health_attr_rating = TargetHealthAttributeRating.find params[:id]
  end

  private

  def target_health_attribute_rating_params
    params.require(:target_health_attribute_rating)
          .permit(:rating, :name)
  end
end
