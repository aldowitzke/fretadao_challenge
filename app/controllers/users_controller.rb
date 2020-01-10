class UsersController < ApplicationController

  def index
    @user = User.last
    if params
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user = Scraper.call(@user).value
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :url, :name, :description)
  end
end