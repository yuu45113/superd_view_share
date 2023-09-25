class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.page(params[:page]).per(6)
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:id, :user_id, :name, :body, :address, :latitude, :longitude, image: [])
  end

end
