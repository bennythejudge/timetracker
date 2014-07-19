class UsersController < ApplicationController
  def index
    @users = User.all
  end
  # any @ variable is visibale from the views
  def show
    @user = User.find(params[:id])
  end
end
