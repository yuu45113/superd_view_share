class Admins::PostsController < ApplicationController
    
  def index
    @posts = Post.page(params[:page]).per 6
  end
  
  private
  
  def post_params
    params.require(:post).permit(:id, :user_id, :name, :body, :address, :latitude, :longitude, image: [])
  end
  
end