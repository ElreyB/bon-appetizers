class EventsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @user = current_user
    @events = Event.all
    @event_menus = @events.first.menu
    @ex_menu = Menu.three_menu
    @desserts = Dessert.pick_of_the_day
    @antipastis = Antipasti.pick_of_the_day
    @mains = Main.pick_of_the_day
    @pasta_dishes = PastaDish.pick_of_the_day
    @bites = Bite.pick_of_the_day
    @styles = Style.all
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @guest = User.find(@event.user_id)
    @menu = Menu.find(@event.menu_id)
  end

  def new
    @users = User.all
    @event = Event.new
  end

  def create
    if current_user.admin
      @user = User.find(event_params[:user_id])
    else
      @user = User.find(current_user.id)
    end
    @event = @user.events.new(event_params)
    if @event.save
      message = "Your event has been saved. Someone will contact you soon."
      if current_user.admin
        redirect_to admins_path, notice: message
      else
        redirect_to user_path(@user), notice: message
      end
    else
      render :new
    end
  end

  def edit
    @users = User.all
    # @user = User.find(current_user.id)
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(@event.user_id)
    end
    if @event.update(event_params)
      message = "Your event has been updated!"
      if current_user.admin
        redirect_to event_path(@event), notice: message
      else
        redirect_to user_path(@user), notice: message
      end
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @event = Event.find(params[:id])
    @event.destroy
    message = "Event has been deleted!"
    if @user.admin
      redirect_to admins_path, notice: message
    else
      redirect_to user_path(@user), notice: message
    end
  end

private

  def event_params
    params.require(:event).permit(:number_of_people, :date_and_time, :party_for, :confirm, :user_id)
  end
end
