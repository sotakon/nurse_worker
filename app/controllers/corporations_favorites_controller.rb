class CorporationsFavoritesController < ApplicationController
    def create
      favorite = current_corporation.corporations_favorites.create(user_id: params[:user_id])
      redirect_to users_path, notice: "#{favorite.user.name}さんをお気に入り登録しました"
    end

    def destroy
      favorite = current_corporation.corporations_favorites.find_by(id: params[:id]).destroy
      redirect_to users_path, notice: "#{favorite.user.name}さんをお気に入り解除しました"
    end
  end 
