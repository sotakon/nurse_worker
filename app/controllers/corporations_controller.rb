class CorporationsController < ApplicationController

  def show
    @favorite_corporation = CorporationsFavorite.all
  end
end

