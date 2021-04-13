# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Corporation.create!(
  name: '医療法人テスト',
  area: '宮城県仙台市',
  email: 'test@test.jp',
  password: '123456',
  password_confirmation: '123456',
  image: open("app/assets/images/hp2.jpg")
  )

20.times do |n|
  gimei = Gimei.female
  address = Gimei.address

  name = gimei.kanji
  area = address.kanji
  age = rand(22..60)
  email = Faker::Internet.email
  uid = SecureRandom.uuid
  type = rand(3)
  subject = ["内科", "外科", "精神科"]
  work = ["日勤のみ", "日勤と夜勤", "パート"]
  advantages = ["急性期看護", "高齢者看護", "管理者経験"]

  User.create!(
    name: name,
    area: area,
    age: age,
    email: email,
    introduction: "これまで#{subject[type]}を中心に勤務してきました。\n
                   次の職場では#{work[type]}の働き方にて転職を希望しております。\n
                   #{advantages[type]}の経験をいかしてお力になりたいと考えております。",
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
  type = rand(3)
  facility = ["病院", "クリニック", "有料老人ホーム"]
  subject = ["内科", "外科", "精神科"]
  work = ["日勤のみ", "日勤と夜勤", "パート"]
  advantages = ["急性期看護", "高齢者看護", "管理者経験"]

  Job.create!(
    corporation_id: 1,
    name: "#{name}#{facility[type]}",
    area: area,
    people: people,
    content: "#{subject[type]}に力を入れて患者様の診察を行っております。\n
              現在#{work[type]}の働き方にて勤務していただける方を募集しております。\n
              #{advantages[type]}の経験がある方歓迎します。"
  )
end

20.times do |n|
  address = Gimei.address

  name = Gimei.last.kanji
  area = address.kanji
  season = rand(2000..2020)
  type = rand(3)
  facility = ["病院", "クリニック", "有料老人ホーム"]
  condition = ["給料", "スキルアップできる点", "人間関係が良い点"]
  demerit = ["夜勤が多い", "法人内での異動が多い", "残業が多い"]
  skill = ["多くの患者様と関わりたい", "高齢者看護がやりたい", "介護業務にも関わりたい"]

  Rumor.create!(
    user_id: 1,
    name: "#{name}#{facility[type]}",
    area: area,
    season: season,
    content: "#{condition[type]}は非常に満足しておりました。\n
              しかし#{demerit[type]}点が改善されない限り長く働くのは難しいと考え退職しました。\n
              #{skill[type]}方にはおすすめ出来る職場です。"
  )
end