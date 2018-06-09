Constants::TARGET_TYPES.each do |name|
  TargetType.find_or_create_by!(name: name)
end

project1 = Project.find_or_create_by!(
  name: "Bob's Project",
  description: "This project is about Bob's Lake and surrounding ecology",
)

target_type = TargetType.find_by!(name: 'Freshwater Ecosystem')

Target.find_or_create_by!(
  name: "Bob's Lake",
  target_type_id: target_type.id,
  description: "Bob's Lake is small lake outside Washington DC that is home to many unqiue and migratory birds. etc.",
  project: project1,
)

project2 = Project.find_or_create_by!(
  name: "Emily's Project",
  description: "This project is about Emily's Lake and surrounding ecology",
)

Target.find_or_create_by!(
  name: "Emily's Lake",
  target_type_id: target_type.id,
  description: "Emily's Lake is small lake outside Washington DC that is home to many unqiue and migratory birds. etc.",
  project: project2,
)
