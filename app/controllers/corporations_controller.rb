class CorporationsController < ApplicationController
  # before_action :authenticate_user! 

  def show
    @corporation = current_user
  end
end

