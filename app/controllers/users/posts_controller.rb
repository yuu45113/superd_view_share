class Users::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:tag].split(',')
    if @post.save
      @post.save_tag(tag_list)
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
  end

  def edit
    @post = Post.find(params[:id])
  end

  def search
    @posts = Post.search(params[:keyword])
    @search_posts = Kaminari.paginate_array(@posts).page(params[:page]).per(6)
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:tag].split(',')
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id)
    else
      edit_post_path(@post.id)
    end
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

