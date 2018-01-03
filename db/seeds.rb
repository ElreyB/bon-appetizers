Wine.destroy_all
Antipasti.destroy_all
PastaDish.destroy_all
Main.destroy_all
Dessert.destroy_all
User.destroy_all
Event.destroy_all
Review.destroy_all


admin = User.create!(first_name: "Admin", last_name: "Admin", phone: '1111111111', email: "admin@admin.com", password: "Admin123!", password_confirmation: "Admin123!", admin: true)

grapes = ["Riesling", "Gewurztraminer", "Chardonnay", "Sauvignon Blanc", "Syrah", "Merlot", "Cabernet Sauvignon", "Pinot Noir"]

grape_index = rand(0..7)
#
# dish_index = rand(0..2)
#
# image_index = rand(0..4)
#
 styles = ["Family style", "Indivial places", "Meeting dinner"]
#
# desserts = ["Bombolini", "Carmelized", "Winter ale Galato"]
#
#
#
# pasta_dishes = ["Tagliatelle", "Squid ink Spaghetti", "Nettle Gnocchi"]
#
# main_dishes = ["Seared sea Scallops", "Slow roasted Pork Belly", "Grilled RIb-eye"]

grapes.each { |grape_type| Wine.create!(grape: grape_type, price: Faker::Number.between(20, 200), description: Faker::Lorem.paragraph)}

menu_items = {
  "Antipasti" => "antipastis",
  "PastaDish" => "pasta_dishes",
  "Main" => "mains",
  "Dessert" => "desserts"
}
menu_items.each do |class_name, file_name|
  CSV.foreach("#{file_name}.csv", { headers: true, :header_converters => :symbol }) do |row|
    new_menu_item = "#{class_name}".constantize.new(row.to_h)
    new_menu_item.save
    # binding.pry
  end
end


2.times do
  users = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, password: "User123!", password_confirmation: "User123!")
  3.times do
    events = users.events.create!(number_of_people: Faker::Number.between(10, 50), date_and_time: Faker::Time.between(2.days.ago, 1.year.from_now, :evening), party_for: Faker::Superhero.name + " Birthday")
    1.times do
      events.menus.create!(style: styles[Faker::Number.between(0, 2)], price: Faker::Number.between(1000, 9888), antipasti: Antipasti.all[rand(0...Antipasti.all.length)].name, pasta: PastaDish.all[rand(0...PastaDish.all.length)], main_dish: Main.all[rand(0...Main.all.length)], dessert: Dessert.all[rand(0...Dessert.all.length)], wine: Wine.all[rand(0...Wine.all.length)])
    end

    5.times do
      events.reviews.create!(rating: Faker::Number.between(1, 5), reviewer: Faker::Name.name, body: Faker::Lorem.paragraph)
    end
  end
end





p "Created #{Wine.count} wines."
p "Created #{Antipasti.count} antipastis."
p "Created #{PastaDish.count} pasta."
p "Created #{Main.count} main dishes."
p "Created #{Dessert.count} desserts."
p "Create #{User.count} users."
p "Create #{Review.count} reviews."
p "Create #{Event.count} events."
