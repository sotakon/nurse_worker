class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(job_id: params[:job_id])
    redirect_to jobs_path, notice: "#{favorite.job.corporation.name}の求人をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to jobs_path, notice: "#{favorite.job.corporation.name}の求人をお気に入り解除しました"
  end
end
