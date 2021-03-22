class UsersController < ApplicationController
  # before_action :authenticate_user! 
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @favorite = current_corporation.corporations_favorites.find_by(user_id: @user.id)
  end
end

