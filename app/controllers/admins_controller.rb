class AdminsController < ApplicationController
  def index
    @users = User.all
    @events = Event.all
    @desserts = Dessert.by_name
    @antipastis = Antipasti.by_name
    @mains = Main.by_name
    @pasta_dishes = PastaDish.by_name
    @wines = Wine.by_grape
  end
end
