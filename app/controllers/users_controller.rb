class UsersController < ApplicationController

  def show
    @user = current_user
    @user_events = Event.user_events(@user.id)
    @user_fullname = "#{current_user.first_name} #{current_user.last_name}"
  end

end
