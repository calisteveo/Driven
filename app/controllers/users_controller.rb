class UsersController < ApplicationController

  def index
  	@id = current_user.id
    @users = User.all
    @friendships = current_user.friendships
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def edit
    id = params[:id]
    user = User.find_by_id(id)
    username = params[:username]
    user.update_attribute(:username, username)

    # redirect_to :root
  end

end
