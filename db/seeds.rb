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
days = [DateTime.now.rfc3339, DateTime.now.days_ago(-2).rfc3339, DateTime.now.days_ago(-1).rfc3339,  DateTime.now.next_day(1).rfc3339]

2.times do
  users = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, password: "User123!", password_confirmation: "User123!")
  3.times do
    events = users.events.create!(number_of_people: Faker::Number.between(10, 50), date_and_time: days.sample.slice(0,16), party_for: Faker::Superhero.name + " " + party_type.sample)
    1.times do
      menu = Menu.create!(event_id: Event.all.sample.id, style_id: Style.all.sample.id)
      events.update(menu_id: menu.id)
    end

    5.times do
      events.reviews.create!(rating: Faker::Number.between(1, 5), reviewer: Faker::Name.name, body: Faker::Lorem.paragraph)
    end
  end
end

Menu.all.each do |menu|
  style_id = menu.style_id
  if Style.find(style_id).name == "HORS D’OEUVRES"
    menu.update(bits: Bit.all.sample(5).map{|bit| bit.name})
    menu.update(price: menu.update_price)
  else
    menu.update(antipastis: Antipasti.all.sample(2).map{|antipasti| antipasti.name})
    menu.update(pastas: PastaDish.all.sample(2).map{|pasta_dish| pasta_dish.name})
    menu.update(main_dishes: Main.all.sample(2).map{|main| main.name})
    menu.update(desserts: [Dessert.all.sample.name])
    menu.update(price: menu.update_price)
  end
end

bits = ["Seasonal_Bruschetta.jpg","homemade-chips.jpg","nuts.jpg","olives.jpg","fitters.jpg","chicken-meatballs.jpg","Prosciutto_wrapped_asparagus.jpeg","onion_asparagus_frittata_squares.jpg","Rosemary_beef_tenderloin_skewers.jpg","beef-braciole.jpg"]
antipastis = ["prosciutto_di_parma.jpg","Salame-Plums-and-Pickled-Blackberries.jpg","Caesar_Salad.jpg","ChicorySalad.jpg","Antipasto-misto.jpg","Arugula_salad.jpg","Stuffed_Artichokes.jpeg"]
desserts = ["Bombolini.jpg","White-Chocolate-Cake.jpg","Olive-Oil-Cake.jpg","Sweet-potato-crespelle.jpg","Winter-ale-gelato.jpg"]
mains = ["Scallops.jpg","Pork-Belly.jpg","Grilled-Rib-eye.jpeg"]
pastas = ["braised-beef-cheeks-with-tagliatelle.jpg","calamari-black-pasta.jpg","ravs-1.jpg","Gnocchi.jpg"]
styles = ["bits.jpg","traditional.jpg","family.jpg"]

Bit.all.each_with_index do |bit, index|
  bit.update(image: File.new("app/assets/images/bits/" + bits[index]))
end
Antipasti.all.each_with_index do |antipasti, index|
  antipasti.update(image: File.new("app/assets/images/antipastis/" + antipastis[index]))
end
PastaDish.all.each_with_index do |pasta, index|
  pasta.update(image: File.new("app/assets/images/pastas/" + pastas[index]))
end
Main.all.each_with_index do |main, index|
  main.update(image: File.new("app/assets/images/mains/" + mains[index]))
end
Dessert.all.each_with_index do |dessert, index|
  dessert.update(image: File.new("app/assets/images/desserts/" + desserts[index]))
end
Style.all.each_with_index do |style, index|
  style.update(image: File.new("app/assets/images/styles/" + styles[index]))
end

Event.all.each do |event|
  event.date_and_time <= Time.parse(DateTime.now.to_s) ? event.update(confirm: true) : nil
end

p "Created #{Bit.count} bits."
p "Created #{Antipasti.count} antipastis."
p "Created #{PastaDish.count} pasta."
p "Created #{Main.count} main dishes."
p "Created #{Dessert.count} desserts."
p "Create #{User.count} users."
p "Create #{Review.count} reviews."
p "Create #{Event.count} events."
