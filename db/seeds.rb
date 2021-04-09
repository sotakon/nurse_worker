# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Corporation.create!(
  name: 'test',
  area: 'test',
  email: 'test@test.jp',
  password: '123456',
  password_confirmation: '123456'
  )

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
    introduction: '（例）\n経験年数:\n経験科目:\n転職理由:\n転職先に求める事:',
    password: '123456',
    password_confirmation: '123456',
    uid: uid
  )
end

20.times do |n|
  address = Gimei.address

  name = Gimei.last.kanji
  area = address.kanji
  people = rand(1..3)

  Job.create!(
    corporation_id: 1,
    name: "#{name}病院",
    area: area,
    content: '（例）\n経験年数:\n経験科目:\n転職理由:\n転職先に求める事:'
  )
end

20.times do |n|
  address = Gimei.address

  name = Gimei.last.kanji
  area = address.kanji
  season = rand(1..20)

  Rumor.create!(
    user_id: 1,
    name: "#{name}病院",
    area: area,
    season: season,
    content: '（例）\n経験年数:\n経験科目:\n転職理由:\n転職先に求める事:'
  )
end