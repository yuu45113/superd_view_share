class Users::HomesController < ApplicationController

  def top
    @posts = Post.page(params[:page]).per 6
  end
end
