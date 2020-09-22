class CommentsController < ApplicationController

    def index
        @comment = Comment.all
    end

    def new
        @comment = Comment.new(post_id: params[:post_id])
        @post = Post.find(params[:post_id])
    end

    def create

        @post = Post.find(params[:comment][:post_id])
        

        # @post = Post.find(params[:post_id])
         @comment = @post.comments.create(comment_params)
        # @comment = Comment.new(comment_params)
        # @post_id = params[:id]


          if @comment.save;
          flash[:notice] = 'Comment was successfully created.'
          redirect_to posts_url
        else
          flash[:notice] = "Error creating comment: #{@comment.errors}"
          redirect_to posts_url
        end

          
    end

    def show
        @comment = Comment.find(params[:id])
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :created_at, :post_id)
    end

end