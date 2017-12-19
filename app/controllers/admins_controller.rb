class AdminsController < ApplicationController
  def index
    @events = Event.all
    @desserts = Dessert.by_name
    @antipastis = Antipasti.by_name
  end
end
