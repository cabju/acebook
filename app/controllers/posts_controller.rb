class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
          redirect_to posts_url
      else
          render 'edit'
      end
  end

  def edit
      @post = Post.find(params[:id])
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to posts_url

  end

  private

  def post_params
    params.require(:post).permit(:message, :created_at)
  end
end
