class TargetType < ApplicationRecord
  has_many :targets
  has_many :default_health_attributes

  def icon_name
    case name
    when 'Terrestrial Ecosystem'
      'globe-africa'
    when 'Freshwater Ecosystem'
      'tint'
    when 'Marine/Estuarine Ecosystem'
      'fish'
    when 'Animal Species or Assemblage'
      'paw'
    when 'Plant Species or Community'
      'tree'
    else
      'question'
    end
  end
end
