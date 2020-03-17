class PagesController < ApplicationController

  def home
    @user = User.new
    # redirect_to new_user_path
  end

  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   @user = User.new user_params
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect_to posts_path
  #   else
  #     render :new
  #   end
  # end

end
