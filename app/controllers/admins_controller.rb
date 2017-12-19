class AdminsController < ApplicationController
  def index
    @events = Event.all
    @desserts = Dessert.by_name
    @antipastis = Antipasti.by_name
    @mains = Main.by_name
    @pastas = Pasta.by_name
    @wines = Wine.by_name
  end
end
