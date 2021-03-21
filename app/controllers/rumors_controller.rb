class RumorsController < ApplicationController
  before_action :set_rumor, only: [:show, :edit, :update]
  def index
    @rumors = Rumor.all
  end
  
  def new
    @rumor = Rumor.new
  end

  def create
    @rumor = Rumor.new(rumor_params)
    if @rumor.save
      redirect_to rumors_path, notice: "クチコミを作成しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @rumor.update(rumor_params)
      redirect_to rumors_path, notice: "クチコミを編集しました！"
    else
      render :edit
    end
  end
  
private
  def rumor_params
    params.require(:rumor).permit(:name, :area, :season, :content)
  end

  def set_rumor
    @rumor = Rumor.find(params[:id])
  end
end
