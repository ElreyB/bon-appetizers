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
  end

  factory :menu do
    bits ["example bit"]
    antipastis ["meats"]
    pastas ["Linage"]
    main_dishes ["other item", "another item"]
    desserts ["example dessert"]
  end
end
