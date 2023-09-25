class Admins::PostCommentsController < ApplicationController
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
  
end
