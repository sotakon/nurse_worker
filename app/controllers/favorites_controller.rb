class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(job_id: params[:job_id])
    FavoriteMailer.favorite_mail(@favorite).deliver
    FavoriteMailer.favorite_corporation_mail(@favorite).deliver
    redirect_to jobs_path, notice: "#{@favorite.job.corporation.name}の求人にエントリーしました"
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to jobs_path, notice: "#{@favorite.job.corporation.name}の求人をリストから削除しました"
  end
end
