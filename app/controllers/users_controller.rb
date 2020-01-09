class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user = Scraper.call(@user).value
    binding.pry
    if @user.save
      render 'pages/index'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :url, :name, :description)
  end
end