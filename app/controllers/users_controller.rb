class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
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
    user.update
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
