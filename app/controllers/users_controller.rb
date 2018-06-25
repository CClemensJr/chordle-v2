class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end
  

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      flash[:success] = "Let's get busy!"
      redirect_to @user
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Chordle has been updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end


  private

    def user_params
      params[:user].permit(:name, :email, :password, :password_confirmation)
    end


    def logged_in_user
      unless logged_in?
        flash[:danger] = "Chordle needs you to log in"
        redirect_to login_url
      end
    end
end
