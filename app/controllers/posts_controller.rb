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
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @post.img = req["public_id"] # this is an URL
      @post.save
    end
    @current_user.posts << @post
    redirect_to @post
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      post.img = req["public_id"]
    end
    post.update_attributes(post_params)
    post.save
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
    params.require(:post).permit(:content, :user_id)
  end

end
