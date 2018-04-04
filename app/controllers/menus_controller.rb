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
    @antipastis = Antipasti.by_name
    @pastas = PastaDish.by_name
    @mains = Main.by_name
    @desserts = Dessert.by_name
    @styles = Style.by_name
    @bites = Bite.by_name
  end

  def create
    @user = current_user
    @users = User.all
    @antipastis = Antipasti.by_name
    @pastas = PastaDish.by_name
    @mains = Main.by_name
    @desserts = Dessert.by_name
    @styles = Style.by_name
    @bites = Bite.by_name
    @event = Event.find(params[:event_id])
    @menu = @event.create_menu(menu_params)
    @menu.update_price
    if @menu.save
      if current_user.admin
        redirect_to event_path(@event), notice: "Guest menu has been added."
      else
        redirect_to user_path(@user)
      end
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @menu = Menu.find(params[:id])
    @antipastis = Antipasti.by_name
    @pastas = PastaDish.by_name
    @mains = Main.by_name
    @desserts = Dessert.by_name
    @styles = Style.by_name
    @bites = Bite.by_name
  end

  def update
    @menu = Menu.find(params[:id])
    @event = Event.find(@menu.event_id)
    @menu.update_price
    if @menu.update(menu_params)
      redirect_to event_path(@event), notice: "Menu has been updated"
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @menu = Menu.find(params[:id])
    if @menu.event_id
      @event = Event.find(@menu.event_id)
      @event.menu.delete
      redirect_to event_path(@event)
    else
      @menu.destroy
      redirect_to menus_path
    end
  end

private

  def menu_params
    params.require(:menu).permit(:style_id, :price, :wine, :bites => [], :antipastis => [], :pastas => [], :main_dishes => [], :desserts => [])
  end
end
