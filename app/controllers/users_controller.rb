class UsersController < ApplicationController

  def show
    if current_user.admin
      @user = User.find(params[:id])
      render :show_user
    else
      @user = current_user
      @user_events = Event.user_events(@user.id)
    end
  end

  def index
    if current_user
      redirect_to "/"
    else
      render "/users/sign_up"
    end
  end

end
