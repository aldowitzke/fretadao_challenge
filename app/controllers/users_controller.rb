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

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    begin
      @user = Scraper.call(@user).value
    rescue
      flash[:danger] = "Twitter user not found 😕. Please, verify your twitter url."
      render :new
    else
      save_user(@user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = user_params[:name]
    @user.url = user_params[:url]
    edit_scrap(@user)
  end


  private

  def edit_scrap(user)
    begin
      @user = Scraper.call(user).value
    rescue
      flash[:danger] = "Twitter user not found 😕. Please, verify your twitter url."
      render :edit
    else
      edit_user(user)
    end
  end

  def edit_user(user)
    if @user.save
      flash[:success] = "Your user has been updated! 🥳"
      redirect_to @user
    else
      flash[:warning] = "Name or URL can't be blank"
      render :new
    end
  end

  def save_user(user)
    if user.save
      flash[:success] = "Your user has been created! 🥳"
      redirect_to root_path
    else
      flash[:warning] = "Name or URL can't be blank"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :url, :name, :description)
  end
end