# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all

Comment.create({author: "Becky", text: "Down with Food!"})
Comment.create({author: "Zak", text: "SHUT IT!"})
Comment.create({author: "Seumus", text: "Shots!"})
