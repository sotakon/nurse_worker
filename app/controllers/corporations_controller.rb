class CorporationsController < ApplicationController

  def show
    @user = User.all
    @corporation = Corporation.find(params[:id])
    if current_corporation
      favorites = CorporationsFavorite.where(corporation_id: current_corporation.id).pluck(:user_id)
      @favorite_corporation = User.find(favorites)
    end
  end
end