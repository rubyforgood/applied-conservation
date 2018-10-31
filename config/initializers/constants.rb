# frozen_string_literal: true
module Constants
  TARGET_OPTIONS = [
    'Forest',
    'Woodland',
    'Savanna',
    'Grassland',
    'Shrubland',
    'Steppe',
    'Tundra',
    'Wetland',
    'Meadow',
    'Riparian',
    'River/Stream/Tributary',
    'Lake',
    'Springs',
    'Estuary',
    'Marine',
    'Ecosystem Mosaic',
    'Rare Plant Community or Species',
    'Resident Bird Fish Mammal Species',
    'Migratory Bird Fish Mammal - specify the life stage',
    'Keystone Species',
    'Umbrella Species',
    'Species Assemblage'
  ].freeze

  TARGET_TYPES = [
    'Terrestrial Ecosystem',
    'Freshwater Ecosystem',
    'Marine/Estuarine Ecosystem',
    'Animal Species or Assemblage',
    'Plant Species or Community',
    'Other',
  ].freeze

  DEFAULT_HEALTH_ATTRIBUTES = [
    'pH',
    'temperature',
    'salinity',
    'nutrients',
    'species diversity',
    'seagrass condition',
    'flow',
    'invasive species',
    'plant cover',
    'soil quality',
    'wind erosion',
    'soil erosion'
    'population growth',
    'Other',
  ].freeze
end
