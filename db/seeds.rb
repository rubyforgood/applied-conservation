# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

project1 = Project.create(name: "Bob's Project",
                         description: "This project is about Bob's Lake and surrounding ecology")

Target.create(name: "Bob's Lake",
              target_type: "lake",
              description: "Bob's Lake is small lake outside Washington DC that is home to many unqiue and migratory birds. etc.",
              project: project1)

project2 = Project.create(name: "Emily's Project",
                         description: "This project is about Emily's Lake and surrounding ecology")
Target.create(name: "Emily's Lake",
              target_type: "lake",
              description: "Emily's Lake is small lake outside Washington DC that is home to many unqiue and migratory birds. etc.",
              project: project2)