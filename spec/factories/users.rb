FactoryBot.define do
  factory :user do
    nickname              {'test'}
    last_name             {'一生'}
    first_name            {'安田'}
    last_name_kana        {'イッセイ'}
    first_name_kana       {'ヤスダ'}
    birth_date            {'19990520'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
  end
end