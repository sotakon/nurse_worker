class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true)
    @corporations = Corporation.all
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
          redirect_to jobs_path, notice: "求人を作成しました！"
        else
          render :new
        end
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(job_id: @job.id)
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: "求人を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: "求人を削除しました！"
  end

  def confirm
    @job = current_corporation.jobs.build(job_params)
    render :new if @job.invalid?
  end
  
private
  def job_params
    params.require(:job).permit(:name, :area, :people, :content, :corporation_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
