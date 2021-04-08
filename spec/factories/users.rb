FactoryBot.define do
  factory :user do
    name { 'テスト' }
    age {'20'}
    area {'test'}
    email { 'test@gmail.com' }
    password { '123456' }
  end
end