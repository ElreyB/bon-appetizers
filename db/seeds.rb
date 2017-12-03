Wine.destroy_all
Antipasti.destroy_all
# Pasta.destroy_all
# MainDish.destroy_all
# Dessert.destroy_all


grapes = ["Riesling", "Gewurztraminer", "Chardonnay", "Sauvignon Blanc", "Syrah", "Merlot", "Cabernet Sauvignon", "Pinot Noir"]

desserts = ["Bombolini", "Carmelized", "Winter ale Galato"]

antipastis = ["PioTosini: Prosciutto di Parma", "Chicory salad", "Stuffed artichokes"]

pasta_dishes = ["Tagliatelle", "Squid ink Spaghetti", "Nettle Gnocchi"]

main_dishes = ["Seared sea Scallops", "Slow roasted Pork Belly", "Grilled RIb-eye"]

grapes.each { |grape_type| Wine.create!(grape: grape_type)}
antipastis.each { |antipasti| Antipasti.create!(name: antipasti)}
# pasta_dishes.each { |pasta| Pasta.create!(name: pasta)}
# main_dishes.each { |main_dish| MainDish.create!(name: main_dish)}
# desserts.each { |dessert| Dessert.create!(name: dessert)}


p "Created #{Wine.count} wines."
p "Created #{Antipasti.count} antipastis."
# p "Created #{Pasta.count} pasta."
# p "Created #{MainDish.count} main dishes."
# p "Created #{Dessert.count} desserts."
