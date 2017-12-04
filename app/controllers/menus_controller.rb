class MenusController < ApplicationController

  def index
    @user = current_user
    @menus = Menu.all
  end

  def show
    @user = current_user
    @menu = Menu.find(params[:id])
  end

  def new
    @user = current_user
    @event = Event.find(params[:event_id])
    @menu = Menu.new
    @wines = Wine.all.by_name
    @antipastis = Antipasti.all.by_name
    @pastas = PastaDish.all.by_name
    @main_dishes = Main.all.by_name
    @desserts = Dessert.all.by_name
  end

  def create
    @user = current_user
    @wines = Wine.all.by_name
    @antipastis = Antipasti.all.by_name
    @pastas = PastaDish.all.by_name
    @main_dishes = Main.all.by_name
    @desserts = Dessert.all.by_name
    @event = Event.find(params[:event_id])
    @menu = @event.menus.new(menu_params)
    if @menu.save
      flash[:notice] = "Guest menu has been added."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Looks like something went wrong:"
      render :new
    end
  end

  def edit
    @user = current_user
    @event = Event.find(params[:event_id])
    @menu = Menu.find(params[:id])
    @wines = Wine.all.by_name
    @antipastis = Antipasti.all.by_name
    @pastas = PastaDish.all.by_name
    @main_dishes = Main.all.by_name
    @desserts = Dessert.all.by_name
  end

  def update
    @user = current_user
    @event = Event.find(params[:event_id])
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice] = "Menu has been updated"
      redirect_to event_path(@event)
    else
      flash[:alert] = "Something went wrong:"
      render :edit
    end
  end

  def destroy
    @user = current_user
    if params([:event_id])
      @event = Event.find(params[:event_id])
      @menu = Menu.find(params[:id])
      @event.menus.delete(@menu)
      redirect_to event_path(@event)
    else
      @menu = Menu.find(params[:id])
      @menu.destroy
      redirect_to menus_path
    end
  end

private

  def menu_params
    params.require(:menu).permit(:style, :price, :antipasti, :pasta, :main_dish, :dessert, :wine, :image)
  end
end
