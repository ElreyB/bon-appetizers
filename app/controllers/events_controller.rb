class EventsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @user = current_user
    @events = Event.all
    @event_menus = @events.first.menu
    @ex_menu = Menu.three_menu
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @menu = @event.menu
  end

  def new
    @user = current_user
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
        # current_user.admin ? (redirect_to admins_path ): (redirect_to user_path(@user))
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
    @user = User.find(current_user.id)
    @event = Event.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      if current_user.admin
        redirect_to event_path(@event), notice: "Your event has been updated!"
      else
        redirect_to user_path(@user), notice: "Your event has been updated!"
      end
    else
      flash[:alert] = "Looks like something went wrong:"
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
