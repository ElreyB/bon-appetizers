class EventsController < ApplicationController

  def index
    @user_fullname = "#{current_user.first_name} #{current_user.last_name}" 
    @events = Event.all
  end

  def show
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(params[:user_id])
    @event = @user.events.new(event_params)
    if @event.save
      flash[:notice] = "Your event has been saved. Someone will contact you soon."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Looks like something wrong:"
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Your event has been updated!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Looks like something went wrong:"
      render :edit
    end
  end

private

  def method_name
    params.require(:event).permit(:numbnumber_of_people, :date_and_time)
  end
end
