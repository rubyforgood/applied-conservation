class TargetService
  def initialize(target)
    @target = target
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
                                                           created_by: attr.created_by,
                                                           updated_by: attr.updated_by) ### FIXME -- should be current_user
      @target.health_assessments.create!(health_attribute: health_attribute,
                                         assessment_type: "current",
                                         created_by: attr.created_by,
                                         updated_by: attr.updated_by) ### FIXME -- should be current_user
      @target.health_assessments.create!(health_attribute: health_attribute,
                                         assessment_type: "projected future with NO action",
                                         created_by: attr.created_by,
                                         updated_by: attr.updated_by) ### FIXME -- should be current_user
      @target.health_assessments.create!(health_attribute: health_attribute,
                                         assessment_type: "projected future with action",
                                         created_by: attr.created_by,
                                         updated_by: attr.updated_by) ### FIXME -- should be current_user
    end
  end
end
