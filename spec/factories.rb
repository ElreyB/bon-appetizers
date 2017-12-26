FactoryBot.define do

  factory :user do
    first_name 'Bob'
    last_name 'Smith'
    phone '1111111111'
    email 'bob@test.com'
    password 'User123!'
    password_confirmation 'User123!'
  end

  factory :event do
    number_of_people 12
    date_and_time "dec. 03,2017"
  end

  factory :menu do
    style "Family Style"
    price "3400"
    antipasti "meats"
    pasta "Linage"
    main "example main"
    dessert "example dessert"
    wine "example wine"
  end
end
