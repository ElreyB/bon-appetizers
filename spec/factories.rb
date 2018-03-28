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
    date_and_time "2019-01-19 20:08:04 -0800"
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
  factory :bit do
    name "bit item"
  end

  factory :style do
    name "The Traditional Italian Dinner with Individually Plated Entrees"
    price 70.00
    pairing 35.00
    description "words"
  end

  factory :menu do
    style_id 1
    bits ["example bit"]
    antipastis ["meats"]
    pastas ["Linage"]
    main_dishes ["other item", "another item"]
    desserts ["example dessert"]
  end
end
