class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

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

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private

    def user_params
      params[:user].permit(:name, :email, :password, :password_confirmation)
    end


    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Chordle needs you to log in"
        redirect_to login_url
      end
    end


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
