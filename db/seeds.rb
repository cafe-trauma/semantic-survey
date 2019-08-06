# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Organization.create!(name: "Dev Org")

q1 = Question.create!(text: "Test question?", q_type: "radio", category: "test-category", short_name: "q1")
Option.create!(question: q1, text: "yes")
Option.create!(question: q1, text: "no")

q2 = Question.create!(text: "Select question", q_type: "select", category: "test-category", short_name: "q2")
Option.create!(question: q2, text: "Option A")
Option.create!(question: q2, text: "Another Option")
Option.create!(question: q2, text: "Yet another Option")

q3 = Question.create!(text: "Select question", q_type: "checkbox", category: "test-category", short_name: "q3")
Option.create!(question: q3, text: "A")
Option.create!(question: q3, text: "B")
Option.create!(question: q3, text: "C")
