# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
  gimei = Gimei.female
  address = Gimei.address

  name = gimei.kanji
  area = address.kanji
  age = rand(20..60)
  email = Faker::Internet.email
  uid = SecureRandom.uuid


  User.create!(
    name: name,
    area: area,
    age: age,
    email: email,
    password: '123456',
    password_confirmation: '123456',
    uid: uid
  )
end