class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @@job = Job.new
  end

  def show
    @job = job.find(params)
  end

  def edit
    @job = job.find(params)
  end

  def create
    @job = job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = job.find(params)
    if @job.update
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = job.find(params)
    @job.destroy
    redirect_to jobs_path
  end


  private

  def job_params
    params.require(:job).permit(:title,:description)
  end
end
