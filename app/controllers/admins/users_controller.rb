class Admins::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def change_deleted
    user = User.find(params[:user_id])
    user.update(is_deleted: !user.is_deleted)
    redirect_to admins_users_path
  end
end
