# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

user_number = 15

user_number.times do |i|
  User.create(
    first_name:Faker::Movies::StarWars.specie,
    last_name:Faker::Games::Minecraft.mob,
    username:Faker::Movies::StarWars.character,
    email:"user#{i}@yopmail.com",
    password:"xabi123",
    password_confirmation:"xabi123"
  )
  system("clear")
  puts "#{i+1} users created"
  puts "|"+("█"*(i+1))+(" "*((user_number-1)-i))+"|"

end

puts ""
puts "Enjoy 🥃 !!!"
puts "----------->"
