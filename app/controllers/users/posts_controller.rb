class Users::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
  
  
    # if params[:tag]
    #   Tag.create(name: params[:tag])
    # end
    
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end
    
  def index
    @posts = Post.page(params[:page]).per 6
  end
  
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def search
    @posts = Post.search(params[:keyword])
  end 
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:id, :user_id, :name, :body, :address, :latitude, :longitude, images: [])
  end
  
end

