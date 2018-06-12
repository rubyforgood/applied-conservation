freshwater_target_type = TargetType.find_by_name('Freshwater Ecosystem')

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