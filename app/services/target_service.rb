class TargetService
  def initialize(target)
    @target = target
  end

  def create
    generate_health_assessments if @target.target_type
  end

  private

  def generate_health_assessments
    health_attributes = @target.target_type.health_attributes
    health_attributes.each do |attr|
      @target.health_assessments.create!(name: attr.title)
    end
  end
end
