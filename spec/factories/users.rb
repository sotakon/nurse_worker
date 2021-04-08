FactoryBot.define do
  factory :user do
    name { 'テスト' }
    age {'20'}
    area {'test'}
    email { 'test@gmail.com' }
    password { '123456' }
  end
  factory :second_user, class: User do
    name { 'テスト2' }
    age {'30'}
    area {'test2'}
    email { 'testtest@test.com' }
    password { '234567' }
  end
end