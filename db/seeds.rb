Antipasti.destroy_all
PastaDish.destroy_all
Main.destroy_all
Dessert.destroy_all
User.destroy_all
Event.destroy_all
Review.destroy_all
Style.destroy_all
Bit.destroy_all


admin = User.create!(first_name: "Admin", last_name: "Admin", phone: '1111111111', email: "admin@admin.com", password: "Admin123!", password_confirmation: "Admin123!", admin: true)

menu_items = {
  "Antipasti" => "antipastis",
  "PastaDish" => "pasta_dishes",
  "Main" => "mains",
  "Dessert" => "desserts",
  "Style" => "styles",
  "Bit" => 'bits'
}
menu_items.each do |class_name, file_name|
  CSV.foreach("CSVs/#{file_name}.csv", { headers: true, :header_converters => :symbol }) do |row|
    new_menu_item = "#{class_name}".constantize.new(row.to_h)
    new_menu_item.save
  end
end

party_type = ["birthday", "anniversary", "office holiday party"]

2.times do
  users = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, password: "User123!", password_confirmation: "User123!")
  3.times do
    events = users.events.create!(number_of_people: Faker::Number.between(10, 50), date_and_time: Faker::Time.between(2.days.ago, 2.days.from_now, :evening), party_for: Faker::Superhero.name + " " + party_type.sample)
    1.times do
      Menu.create!(event_id: Event.all.sample.id, style_id: Style.all.sample.id)
    end

    5.times do
      events.reviews.create!(rating: Faker::Number.between(1, 5), reviewer: Faker::Name.name, body: Faker::Lorem.paragraph)
    end
  end
end

Menu.all.each do |menu|
  style_id = menu.style_id
  if Style.find(style_id) == "HORS D’OEUVRES"
    menu.update(bits: Bit.all.sample(5).map{|bit| bit.name})
  else
    menu.update(antipastis: Antipasti.all.sample(2).map{|antipasti| antipasti.name})
    menu.update(pastas: PastaDish.all.sample(2).map{|pasta_dish| pasta_dish.name})
    menu.update(main_dishes: Main.all.sample(2).map{|main| main.name})
    menu.update(desserts: [Dessert.all.sample.name])
  end
end

p "Created #{Bit.count} bits."
p "Created #{Antipasti.count} antipastis."
p "Created #{PastaDish.count} pasta."
p "Created #{Main.count} main dishes."
p "Created #{Dessert.count} desserts."
p "Create #{User.count} users."
p "Create #{Review.count} reviews."
p "Create #{Event.count} events."
