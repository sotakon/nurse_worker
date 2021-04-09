class CorporationsFavoritesController < ApplicationController
  def create
    @favorite = current_corporation.corporations_favorites.create(user_id: params[:user_id])
    OfferMailer.offer_mail(@favorite).deliver
    OfferMailer.offer_corporation_mail(@favorite).deliver
    redirect_to user_path(@favorite.user.id), notice: "#{@favorite.user.name}さんにスカウトメールを送りました"
  end

  def destroy
    @favorite = current_corporation.corporations_favorites.find_by(id: params[:id]).destroy
    redirect_to corporation_path(current_corporation), notice: "#{@favorite.user.name}さんをリストから削除しました"
  end
end 
