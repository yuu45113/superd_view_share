class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @user_posts=@user.posts
  end

  def edit
    @user = current_user
  end

  def confirm
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def withdrawal
    @user = current_user
    @user.update(is_deleted:true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :image, :email)
  end
end
