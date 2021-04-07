class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :corporation_check, only: [:new, :edit, :create]

  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true).page(params[:page]).order(created_at: :desc)
    @corporations = Corporation.all
    @jobs = @jobs.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end
  
  def new
    @job = Job.new
  end

  def create
    def create
      @job = current_corporation.jobs.build(job_params)
      if params[:back]
        render :new
      else
        if @job.save
          redirect_to jobs_path, notice: "求人を作成しました"
        else
          render :new
        end
      end
    end
  end

  def show
    if current_corporation
      @job = Job.find(params[:id])
    else
      @favorite = current_user.favorites.find_by(job_id: @job.id)
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: "求人を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: "求人を削除しました"
  end

  def confirm
    @job = current_corporation.jobs.build(job_params)
    render :new if @job.invalid?
  end

  def new_guest
    corporation = Corporation.find_or_create_by!(email: 'guest@example.com') do |c|
      c.password = SecureRandom.urlsafe_base64
      c.name = "ゲストユーザー(法人)"
      c.area = "ゲスト"
    end
    sign_in corporation
    redirect_to root_path, notice: 'ゲストユーザー(法人)としてログインしました。'
  end
  
private
  def job_params
    params.require(:job).permit(:name, :area, :people, :content, :corporation_id, :title, { label_ids: [] })
  end

  def set_job
    @job = Job.find(params[:id])
  end

  private
  def corporation_check
    if current_corporation
      users_path
    else
      redirect_to tops_path, notice: "ログインしている法人様しか閲覧できません"
    end
  end
end
