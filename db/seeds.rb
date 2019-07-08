# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Operation.destroy_all
User.destroy_all

User.create! username: 'Fry'
User.create! username: 'Bender'
User.create! username: 'Leela'
User.create! username: 'Zoidberg'
User.create! username: 'Amy'

User.all.each do |user|
  5.times { user.operations.create! value: rand(-9..10), datetime: DateTime.now }
end
