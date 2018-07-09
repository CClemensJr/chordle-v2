class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user   = User.find(params[:id])
    @chores = @user.chores.paginate(page: params[:page])
    @chore  = current_user.chores.build
    @available_time = params[:available_time]
    

    if current_user.chores.where(priority: "High").any?
      #Return a random chore with a priority level of High
      @chordle_says = current_user.chores.where(["priority = ? and time_to_complete <= ?", "High", "@available_time" ]).sample.description
    elsif current_user.chores.where(priority: "Medium").any?
      #Return a random chore with a priority level of Medium
      @chordle_says = current_user.chores.where(["priority = ? and time_to_complete <= ?", "Medium", "@available_time" ]).sample.description
    elsif current_user.chores.where(["priority = ? and time_to_complete <= ?", "Low", "@available_time" ]).any?
      #Return a random chore with a priority level of Low
      @chordle_says = current_user.chores.where(priority: "Low").sample.description
    else
      @chordle_says = "Give me a chore!"
    end
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

=begin
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Chordle needs you to log in"
        redirect_to login_url
      end
    end
=end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
