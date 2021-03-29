class UsersController < ApplicationController
  before_action :corporation_check, only: [:index]
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def show
    if current_user
      @user = User.find(params[:id])
      @favorite = Favorite.all
    elsif current_corporation
      @user = User.find(params[:id])
      @favorite = current_corporation.corporations_favorites.find_by(user_id: @user.id)
    else
      redirect_to tops_path, notice: "このページは閲覧できません。"
    end
  end
end

private
def corporation_check
  if current_corporation || current_user.admin? || current_user
    users_path
  else
    redirect_to tops_path, notice: "ログインしている法人様しか閲覧できません。"
  end
end