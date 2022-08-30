class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_user_match, only: [:edit, :update, :destroy]

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
      flash[:notice] = "Post successfully created."
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post successfully updated."
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted."
    redirect_to root_path
  end

  private 

  def post_params
    params.require(:post).permit(:title, :body)
  end

  # The resource being edited or deleted must belong to the current user
  def require_user_match
    current_user.posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "You do not have permission to #{action_name} this post!"
    redirect_to post_path
  end
end
