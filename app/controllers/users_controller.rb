class UsersController < ApplicationController
  before_action :corporation_check, only: [:index]
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def show
    @job = Job.all
    @user = User.find(params[:id])
    if current_user
      favorites = Favorite.where(user_id: current_user.id).pluck(:job_id)
      @favorite = Job.find(favorites)
    elsif current_corporation
      @favorite = current_corporation.corporations_favorites.find_by(user_id: @user.id)
    else
      redirect_to tops_path, notice: "このページは閲覧できません"
    end
  end
end

private
def corporation_check
  if current_corporation || current_user.admin? || current_user
    users_path
  else
    redirect_to tops_path, notice: "ログインしている法人様しか閲覧できません"
  end
end