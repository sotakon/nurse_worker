class AdminsController < ApplicationController
  before_action :if_not_admin
  before_action :set_restaurant, only: [:show, :edit, :destroy]

def index
  @users = User.all
  @corporations = Corporation.all
  @jobs = Job.all
  @rumors =Rumor.all
end

  private
  def if_not_admin
    if current_user != nil && current_user.admin?
    elsif current_corporation || current_user || current_user == nil
      redirect_to root_path 
    end
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
