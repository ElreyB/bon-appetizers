class UsersController < ApplicationController

  def show
    @user = current_user
    @user_events = Event.user_events(user_id)
  end

end
