class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(job_id: params[:job_id])
    FavoriteMailer.favorite_mail(@favorite).deliver
    FavoriteMailer.favorite_corporation_mail(@favorite).deliver
    redirect_to job_path(@favorite.job), notice: "#{@favorite.job.name}様にエントリーメールが送信されました"
  end

  def destroy
    if current_user
      @favorite = current_user.favorites.find_by(id: params[:id]).destroy
      redirect_to user_path(current_user), notice: "#{@favorite.job.name}の求人をリストから削除しました"
    else
      @favorite = Favorite.find_by(id: params[:id]).destroy
      redirect_to corporation_path(current_corporation), notice: "#{@favorite.user.name}さんをリストから削除しました"
    end
  end
end
