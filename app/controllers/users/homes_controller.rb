class Users::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def top
    @posts = Post.page(params[:page]).per 6
  end
end
