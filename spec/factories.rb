FactoryBot.define do
  
  factory :user do
    first_name 'Bob'
    last_name 'Smith'
    phone '1111111111'
    email 'bob@test.com'
    password '123456'
    password_confirmation '123456'
  end

  factory :event do
    number_of_people 12
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
