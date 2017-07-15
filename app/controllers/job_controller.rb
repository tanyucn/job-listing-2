class JobController < ApplicationController
  def index
    @group.all
  end
  def new
    @group.new
  end
  def show
    @group = Group.find(params[:id])

  end
  def edit
    @group = Group.find(params[:id])
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end
  def update
    @group = Group.find(params)
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end
  def distroy
    @group = Group.find(params)
    @group.delete
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:title,:description)
  end

end
