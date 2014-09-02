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

end
