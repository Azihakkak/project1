class CommentsController < ApplicationController
  before_action :check_for_login

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.create comment_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      comment.img = req["public_id"]
      comment.save
    end
    redirect_to comment.post
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.post
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :img, :user_id, :post_id)
  end

end
