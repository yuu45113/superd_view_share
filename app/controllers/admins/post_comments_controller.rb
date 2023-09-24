class Admins::PostCommentsController < ApplicationController
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admins_post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
  
end
