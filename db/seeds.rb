# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

user_number = 15
article_number = 50

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

article_number.times do |i|
  Article.create(
    stream:Faker::Avatar.image,
    description:Faker::DcComics.title,
    user_id:User.all.sample.id,
    private:[true,false].sample
  )
  system("clear")
  puts "#{i+1} articles created"
  puts "|"+("█"*(i/2+1))+(" "*((article_number/2-1)-i/2))+"|"
end

Article.all.each_with_index do |article,i|
  Comment.create(
    content:Faker::ChuckNorris.fact,
    user_id:User.all.sample.id,
    article_id:article.id,
  )
  system("clear")
  puts "#{i+1} comments created"
  puts "|"+("█"*(i/2+1))+(" "*((article_number/2-1)-i/2))+"|"

end

puts ""
puts "Enjoy 🥃 !!!"
puts "----------->"
