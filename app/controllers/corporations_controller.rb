class CorporationsController < ApplicationController

  def show
    @user = User.all
    favorites = CorporationsFavorite.where(corporation_id: current_corporation.id).pluck(:user_id)
    @favorite_corporation = User.find(favorites)
  end
end

