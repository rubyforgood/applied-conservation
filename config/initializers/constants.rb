# frozen_string_literal: true
module Constants
  TARGET_OPTIONS = {
    'forest': 'Forest',
    'woodland': 'Woodland',
    'savanna': 'Savanna',
    'grassland': 'Grassland',
    'shrubland': 'Shrubland',
    'steppe': 'Steppe',
    'tundra': 'Tundra',
    'wetland': 'Wetland',
    'meadow': 'Meadow',
    'riparian': 'Riparian',
    'river_stream_tributary': 'River/Stream/Tributary',
    'lake': 'Lake',
    'springs': 'Springs',
    'estuary': 'Estuary',
    'marine': 'Marine',
    'ecosystem_mosaic': 'Ecosystem Mosaic',
    'rare_plant_community_or_species': 'Rare Plant Community or Species',
    'resident_bird_fish_mammal_species': 'Resident Bird Fish Mammal Species',
    'migratory_bird_fish_mammal': 'Migratory Bird Fish Mammal - specify the life stage',
    'keystone_species': 'Keystone Species',
    'umbrella_species': 'Umbrella Species',
    'species_assemblage': 'Species Assemblage',
  }.freeze

  TARGET_TYPES = [
    'Terrestrial Ecosystem',
    'Freshwater Ecosystem',
    'Marine/Estuarine Ecosystem',
    'Animal Species or Assemblage',
    'Plant Species or Community',
    'Other',
  ].freeze
end
