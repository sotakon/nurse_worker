FactoryBot.define do
  factory :corporation do
    name { 'テスト' }
    area {'test'}
    email { 'test@corporation.com' }
    password { '123456' }
  end
  factory :second_corporation, class: Corporation do
    name { 'テスト2' }
    area {'test2'}
    email { 'testtest@corporation.com' }
    password { '234567' }
  end
end