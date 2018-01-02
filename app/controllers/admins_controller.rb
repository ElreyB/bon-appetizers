class AdminsController < ApplicationController
  def index
    @users = User.all
    @events = Event.all
    @desserts = Dessert.pick_of_the_day
    @antipastis = Antipasti.pick_of_the_day
    @mains = Main.pick_of_the_day
    @pasta_dishes = PastaDish.pick_of_the_day
    @wines = Wine.pick_of_the_day
  end
end
