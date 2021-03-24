class UsersController < ApplicationController
  before_action :corporation_check, only: [:index]
  def index
    # @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    if current_user
      @user = User.find(params[:id])
    else
      @user = User.find(params[:id])
      @favorite = current_corporation.corporations_favorites.find_by(user_id: @user.id)
    end
  end
end

private
def corporation_check
  if current_corporation
    users_path
  else
    redirect_to tops_path, notice: "ログインしている法人様しか閲覧できません。"
  end
end