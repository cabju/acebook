class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  def index
    @post = Post.all.order("created_at DESC")
    @comments = Comment.new
    
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(update_post_params)
      redirect_to posts_url
  else
      render 'edit'
  end
end


  private

  def post_params
    params.require(:post).permit(:message, :created_at)
  end

  def update_post_params
    params.require(:post).permit(:message, :updated_at)
  end

end
