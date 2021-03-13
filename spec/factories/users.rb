FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000a'}
    password_confirmation {password}
    family_name           {'田中'}
    give_name             {'太郎'} 
    family_name_kana      {'タナカ'}
    give_name_kana        {'タロウ'}
    birthday              {'1930-01-01'}
  end
end