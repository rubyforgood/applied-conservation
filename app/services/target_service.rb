class TargetService
  def initialize(target)
    @target = target
  end

  def create
    return unless @target.save

    generate_target_health_attribute_ratings if @target.target_type
    @target
  end

  private

  def generate_target_health_attribute_ratings
    health_attributes = @target.target_type.health_attributes
    health_attributes.each do |attr|
      @target.target_health_attribute_ratings.create!(health_attribute: attr)
    end
  end
end
