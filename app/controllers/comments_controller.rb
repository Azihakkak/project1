class CommentsController < ApplicationController
  before_action :check_for_login

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params
    comment.save
    redirect_to post
  end





  private
  def comment_params
    params.require(:comment).permit(:content, :img, :user_id)
  end

end
end
