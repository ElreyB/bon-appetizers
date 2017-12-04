Wine.destroy_all
Antipasti.destroy_all
PastaDish.destroy_all
Main.destroy_all
Dessert.destroy_all
User.destroy_all
Event.destroy_all
Review.destroy_all


admin = User.create!(first_name: "Admin", last_name: "Admin", phone: '1111111111', email: "admin@admin.com", password: "password", password_confirmation: "password", admin: true)

grapes = ["Riesling", "Gewurztraminer", "Chardonnay", "Sauvignon Blanc", "Syrah", "Merlot", "Cabernet Sauvignon", "Pinot Noir"]

grape_index = rand(0..7)

dish_index = rand(0..2)

image_index = rand(0..4)

styles = ["Family style", "Indivial places", "Meeting dinner"]

desserts = ["Bombolini", "Carmelized", "Winter ale Galato"]

antipastis = ["PioTosini: Prosciutto di Parma", "Chicory salad", "Stuffed artichokes"]

pasta_dishes = ["Tagliatelle", "Squid ink Spaghetti", "Nettle Gnocchi"]

main_dishes = ["Seared sea Scallops", "Slow roasted Pork Belly", "Grilled RIb-eye"]

grapes.each { |grape_type| Wine.create!(grape: grape_type)}
antipastis.each { |antipasti| Antipasti.create!(name: antipasti)}
pasta_dishes.each { |pasta| PastaDish.create!(name: pasta) }
main_dishes.each { |main_dish| Main.create!(name: main_dish)}
desserts.each { |dessert| Dessert.create!(name: dessert)}


2.times do
  users = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, password: "123456", password_confirmation: "123456")

  3.times do
    events = users.events.create!(number_of_people: Faker::Number.between(10, 50), date_and_time: Faker::Time.between(2.days.ago, Date.today, :evening), party_for: Faker::Superhero.name + " Birthday")
    2.times do
      events.menus.create!(style: styles[Faker::Number.between(0, 2)], price: Faker::Number.between(1000, 9888), antipasti: antipastis[Faker::Number.between(0, 2)], pasta: pasta_dishes[Faker::Number.between(0, 2)], main_dish: main_dishes[Faker::Number.between(0, 2)], dessert: desserts[Faker::Number.between(0, 2)], wine: grapes[Faker::Number.between(0, 7)], image: File.open(File.join(Rails.root, "/app/assets/images/image" + Faker::Number.between(0, 4).to_s + ".jpg")))
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
