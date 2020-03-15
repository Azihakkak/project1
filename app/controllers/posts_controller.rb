class PostsController < ApplicationController
before_action :check_for_login

  def index
    @posts = Post.all
    @user = User.all
  end

  def new
  end


end
