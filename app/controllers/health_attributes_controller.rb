class HealthAttributesController < ApplicationController
  before_action :load_health_attribute, only: %i[show edit update destroy]
  before_action :load_target, only: %i[new create]
  def update
    @health_attribute = HealthAttribute.find(params[:id])

    if @health_attribute.update(health_attribute_params)
      flash[:notice] = 'Health Attribute Updated'
      redirect_to target_url(@health_attribute.target)
    else
      flash.now[:alert] = @health_attribute.errors.full_messages
      render :edit
    end
  end

  def edit
    add_breadcrumb(
      'Edit',
      edit_health_attribute_path(@health_attribute)
    )
  end

  def show; end

  def new
    @health_attribute = HealthAttribute.new
    add_breadcrumb 'New Health Attribute',
                   new_target_health_attribute_path(@target)
    render :new
  end

  def create
    @health_attribute = HealthAttribute.new(health_attribute_params)
    if @health_attribute.save
      flash[:notice] = 'Health Attribute Created'
      redirect_to target_path(@target)
    else
      flash.now[:alert] = @health_attribute.errors.full_messages
      render :new
    end
  end

  def destroy
    target = @health_attribute.target

    @health_attribute.destroy!
    flash[:notice] = 'Target Deleted'
    redirect_to target_path(target)
  end

  def load_target
    @target = Target.find params[:target_id]
  end

  def load_health_attribute
    @health_attribute = HealthAttribute.find params[:id]
    @target = @health_attribute.target
    @project = @target.project

    add_breadcrumb @target.name, target_path(@target)
    add_breadcrumb(
      @health_attribute.name,
      health_attribute_path(@health_attribute)
    )
  end

  private

  def health_attribute_params
    health_attr_prams = params.require(:health_attribute)
                              .permit(:name, :description)
    health_attr_prams.merge(updated_by: current_user, created_by: current_user, target_id: params[:target_id])
  end
end
