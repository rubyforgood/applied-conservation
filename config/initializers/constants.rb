# frozen_string_literal: true
module Constants
  TARGET_OPTIONS = [
    {value: 'forest', label: 'Forest'},
    {value: 'woodland', label: 'Woodland'},
    {value: 'savanna', label: 'Savanna'},
    {value: 'grassland', label: 'Grassland'},
    {value: 'shrubland', label: 'Shrubland'},
    {value: 'steppe', label: 'Steppe'},
    {value: 'tundra', label: 'Tundra'},
    {value: 'wetland', label: 'Wetland'},
    {value: 'meadow', label: 'Meadow'},
    {value: 'riparian', label: 'Riparian'},
    {value: 'river_stream_tributary', label: 'River/Stream/Tributary'},
    {value: 'lake', label: 'Lake'},
    {value: 'springs', label: 'Springs'},
    {value: 'estuary', label: 'Estuary'},
    {value: 'marine', label: 'Marine'},
    {value: 'ecosystem_mosaic', label: 'Ecosystem Mosaic'},
    {value: 'rare_plant_community_or_species', label: 'Rare Plant Community or Species'},
    {value: 'resident_bird_fish_mammal_species', label: 'Resident Bird Fish Mammal Species'},
    {value: 'migratory_bird_fish_mammal', label: 'Migratory Bird Fish Mammal - specify the life stage'},
    {value: 'keystone_species', label: 'Keystone Species'},
    {value: 'umbrella_species', label: 'Umbrella Species'},
    {value: 'species_assemblage', label: 'Species Assemblage'},
  ].freeze

  TARGET_TYPES = [
    'Terrestrial Ecosystem',
    'Freshwater Ecosystem',
    'Marine/Estuarine Ecosystem',
    'Animal Species or Assemblage',
    'Plant Species or Community',
    'Other',
  ].freeze
end
