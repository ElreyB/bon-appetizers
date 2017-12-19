class AdminsController < ApplicationController
  def index
    @events = Event.all
    @desserts = Dessert.by_name
  end
end
