class SessionsController < ApplicationController
  
  def index
    if current_user
      redirect_to user_path(current_user.id)
    end
  end

  def create
    # raise env["omniauth.auth"].to_yaml
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to user_path(user.id)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
