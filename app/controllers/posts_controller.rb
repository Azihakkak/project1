class PostsController < ApplicationController
before_action :check_for_login

  def index
    @posts = Post.all
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create post_params
    @current_user.posts << @post
    redirect_to @post
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update post_params
    redirect_to post
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to posts_path
  end



  private
  def post_params
    params.require(:post).permit(:content, :img, :user_id)
  end

end
