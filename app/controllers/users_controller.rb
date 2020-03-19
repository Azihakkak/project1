class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @user.img = req["public_id"] # this is an URL
      @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      user.img = req["public_id"]
    end
    user.update_attributes(post_params)
    user.save
    redirect_to user
  end

   def show
     @user = User.find params[:id]
     @posts = @user.posts
   end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :location, :img)
  end

end
