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
    party_for "Sam's Bday"
    number_of_people 12
    date_and_time DateTime.now.days_ago(-1).rfc3339
  end

  factory :antipasti do
    name "antipasti item"
    description "words"
  end
  factory :main do
    name "main item"
    description "words"
  end
  factory :pasta_dish do
    name "pasta_dish item"
    description "words"
  end
  factory :dessert do
    name "dessert item"
    description "words"
  end
  factory :bite do
    name "bite item"
  end

  factory :style do
    name "The Traditional Italian Dinner with Individually Plated Entrees"
    price 70.00
    pairing 35.00
    description "words"
  end

  factory :menu do
    style_id 1
    bites ["example bite"]
    antipastis ["meats"]
    pastas ["Linage"]
    main_dishes ["other item", "another item"]
    desserts ["example dessert"]
  end
end
