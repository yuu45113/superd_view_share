class Admins::UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @user = Customer.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_users_path
  end
  
  
  
  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :email )
  end
end
