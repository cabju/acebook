class PostsController < ApplicationController
  def new
    @post = Post.new
  end


  def create
    @post = Post.create(post_params)
    # @post.created_at.strftime("%B %d %Y, %l:%M%P")
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  def index

    @posts = Post.all.order("created_at DESC")

  end

  # def show
  ##   @post = Post.find(params[:id])
  # end 

  def edit
    @post = Post.find(params[:id])

  end 
  private

  def post_params

    params.require(:post).permit(:message, :created_at)

  end

end
