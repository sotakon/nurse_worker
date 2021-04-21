class CorporationsController < ApplicationController

  def show
    @user = User.all
    @job = Job.all
    @corporation = Corporation.find(params[:id])
  


    if current_corporation
      favorites = CorporationsFavorite.where(corporation_id: current_corporation.id).pluck(:user_id)
      @favorite_corporation = User.find(favorites)
      offers = Favorite.where(job_id: @job.ids).pluck(:user_id)
      @favorite_users = User.find(offers)
      # @current_job = current_corporation.jobs.find()
      # binding.irb
    end
  end
end