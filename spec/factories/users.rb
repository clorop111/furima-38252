FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    
    transient do
      person { Gimei.name }
   end
  
    first_name_kanji { person.first.kanji }
    last_name_kanji { person.last.kanji }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }

    date_of_birth{Faker::Date.backward}
  end
end