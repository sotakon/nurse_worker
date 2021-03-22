class UsersController < ApplicationController
  # before_action :authenticate_user! 
  def index
    # @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @favorite = current_corporation.corporations_favorites.find_by(user_id: @user.id)
  end
end

