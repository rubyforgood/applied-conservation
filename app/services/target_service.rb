class TargetService
  def initialize(target, current_user)
    @target = target
    @current_user = current_user
  end

  def create
    return unless @target.save

    generate_associated_records if @target.target_type
    @target
  end

  private

  def generate_associated_records
    default_health_attributes = @target.target_type.default_health_attributes
    default_health_attributes.each do |attr|
      health_attribute = @target.health_attributes.create!(name: attr.name,
                                                           default_health_attribute: attr,
                                                           created_by: @current_user,
                                                           updated_by: @current_user)
      health_attribute.create_health_assessments
    end
  end
end
