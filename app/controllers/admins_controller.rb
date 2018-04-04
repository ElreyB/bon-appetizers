class AdminsController < ApplicationController
  def index
    @users = User.all
    @events_within_30_days = Event.within_30_days
    @desserts = Dessert.pick_of_the_day
    @antipastis = Antipasti.pick_of_the_day
    @mains = Main.pick_of_the_day
    @pasta_dishes = PastaDish.pick_of_the_day
    @bites = Bite.pick_of_the_day
  end
end
