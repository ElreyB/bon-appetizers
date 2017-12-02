class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @menu = Menu.new
  end

  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @menu = event.menus.new(menu_params)
    if @menu.save
      flash[:notice] = "Guest menu has been added."
      redirect_to user_path(@user)
    else
      flash[:notice] = "Looks like something went wrong:"
      render :new
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @menu = Menu.find(params[:id])
  end

  def update
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
    params.require(:menu).permit(:style, :price, :antipasti, :pasta, :main_dish, :dessert, :wine)
  end
end
