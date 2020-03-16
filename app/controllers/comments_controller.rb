class CommentsController < ApplicationController
  before_action :check_for_login

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create comment_params
    @current_user.comments << comment
    @post.comments << comment
    redirect_to post
  end





  private
  def comment_params
    params.require(:comment).permit(:content, :img, :user_id)
  end

end
