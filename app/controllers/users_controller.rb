class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Let's get busy!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params[:user].permit(:name, :email, :password, :password_confirmation)
    end
end
