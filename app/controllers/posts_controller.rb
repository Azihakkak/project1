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
    @post = Post.new post_params
    @users = User.all
    post.save
    redirect_to post
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
    @comments = Comment.all
  end




  private
  def post_params
    params.require(:post).permit(:content, :img, :user_id)
  end

end
