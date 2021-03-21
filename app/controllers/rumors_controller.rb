class RumorsController < ApplicationController
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
    @rumor = Rumor.find(params[:id])
  end
  
private
  def rumor_params
    params.require(:rumor).permit(:name, :area, :season, :content)
  end
end
