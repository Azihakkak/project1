class CommentsController < ApplicationController
  before_action :check_for_login

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create comment_params
    # post = Post.find params[:post_id]
    # post.comments << @comment
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to comment.post
  end


  private
  def comment_params
    params.require(:comment).permit(:content, :img, :user_id, :post_id)
  end

end
