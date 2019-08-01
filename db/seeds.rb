# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

o1 = Organization.create!(name: "Dev Org")

q1 = Question.create!(text: "Test question?", q_type: "radio", category: "test-category", short_name: "q1")
Option.create!(question: q1, text: "yes")
Option.create!(question: q1, text: "no")
