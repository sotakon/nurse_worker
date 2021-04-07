class TopsController < ApplicationController
  def index
    @jobs = Job.order(created_at: :desc).limit(3)
  end
end