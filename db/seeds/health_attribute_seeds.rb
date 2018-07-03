freshwater_target_type = TargetType.find_by_name('Freshwater Ecosystem')
terrestrial_target_type = TargetType.find_by_name('Terrestrial Ecosystem')

HealthAttribute.find_or_create_by!(
  title: 'Flows',
  target_type: freshwater_target_type,
  description: 'amount, timing, and duration of freshwater flows (surface water and/or groundwater)')
HealthAttribute.find_or_create_by!(
  title: 'Riparian Vegetation',
  target_type: freshwater_target_type,
  description: 'composition, structure and extent')
HealthAttribute.find_or_create_by!(
  title: 'Native Aquatic Animals',
  target_type: freshwater_target_type,
  description: '(fish, amphibians, other) - composition and abundance')
HealthAttribute.find_or_create_by!(
  title: 'Physical Integrity',
  target_type: freshwater_target_type,
  description: 'physical alteration of bank or wetland; channel morphology')
HealthAttribute.find_or_create_by!(
  title: 'Water Quality',
  target_type: freshwater_target_type,
  description: 'dissolved oxygen, sediment, nutrients, toxins')

HealthAttribute.find_or_create_by!(
  title: 'Fire regime',
  target_type: terrestrial_target_type,
  description: 'frequency, type of fires, size')
HealthAttribute.find_or_create_by!(
  title: 'Composition',
  target_type: terrestrial_target_type,
  description: 'native species')
HealthAttribute.find_or_create_by!(
  title: 'Structure',
  target_type: terrestrial_target_type,
  description: 'age classes, canopy cover')
HealthAttribute.find_or_create_by!(
  title: 'Size',
  target_type: terrestrial_target_type,
  description: 'minimum dynamic area')
