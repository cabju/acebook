class CommentsController < ApplicationController

    def index
        @comment = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create

          @comment = Comment.create(comment_params)

          redirect_to posts_url
    end

    def show
        @comment = Comment.find(params[:id])
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :created_at)
    end

end