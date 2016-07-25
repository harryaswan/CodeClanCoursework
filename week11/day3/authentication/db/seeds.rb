# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Account.delete_all

jay = User.create({email: 'jay@test.com', password:'jpass12', password_confirmation:'jpass12'})
harry = User.create({email: 'harry@test.com', password:'hpass12', password_confirmation:'hpass12'})
becky = User.create({email: 'becky@test.com', password:'bpass12', password_confirmation:'bpass12'})


harry.accounts.create({ amount: 59992, name: "Savings"})
becky.accounts.create({amount: 7883, name: "Wedding Money"})
jay.accounts.create({amount: 1244, name: "Holiday Money"})


# Account.create({user_id: harry.id, amount: 59992, name: "Savings"})
# Account.create({user_id: becky.id, amount: 7883, name: "Wedding Money"})
# Account.create({user_id: jay.id, amount: 1244, name: "Holiday Money"})
