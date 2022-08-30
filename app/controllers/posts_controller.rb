class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "You do not have permission to edit this post!"
    redirect_to post_path
  end

  private 

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
