class RumorsController < ApplicationController
  before_action :set_rumor, only: [:show, :edit, :update, :destroy]
  before_action :user_check, except: [:new_guest]

  def index
    @q = Rumor.ransack(params[:q])
    @rumors = @q.result(distinct: true).page(params[:page])
    @users = User.all
  end
  
  def new
    @rumor = Rumor.new
  end

  def create
    def create
      @rumor = current_user.rumors.build(rumor_params)
      if params[:back]
        render :new
      else
        if @rumor.save
          redirect_to rumors_path, notice: "クチコミを作成しました"
        else
          render :new
        end
      end
    end
  end

  def show
    @comments = @rumor.comments
    @comment = @rumor.comments.build
  end

  def edit
  end

  def update
    if @rumor.update(rumor_params)
      redirect_to rumors_path, notice: "クチコミを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @rumor.destroy
    redirect_to rumors_path, notice:" クチコミを削除しました"
  end

  def confirm
    @rumor = current_user.rumors.build(rumor_params)
    render :new if @rumor.invalid?
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー（看護師）"
      user.age = 22
      user.area = "ゲスト"
      user.admin = true
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザー(看護師)としてログインしました。'
  end
  
private
  def rumor_params
    params.require(:rumor).permit(:name, :area, :season, :content, :user_id)
  end

  def set_rumor
    @rumor = Rumor.find(params[:id])
  end
end

def user_check
  if current_user
    rumors_path
  else
    redirect_to tops_path, notice: "ログインしている看護師様しか閲覧できません"
  end
end