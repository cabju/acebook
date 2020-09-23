class CommentsController < ApplicationController

    # def index
    #     @comment = Comment.all
    # end

    # def new
    #     @comment = Comment.new(post_id: params[:post_id])
    #    # @post = Post.find(params[:post_id])
    # end

    def create

        @post = Post.find(params[:post_id])
         #@comment = @post.comments.create(params[:comment].permit(:name, :comment))
         @comment = post.comments.create(comment_params.merge(user_id: current_user.id))
        
        redirect_to post_path(@post) 


          if @comment.save;
          flash[:notice] = 'Comment was successfully created.'

        else
          flash[:notice] = "Error creating comment: #{@comment.errors}"

        end

          
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    # def show
    #     @comment = Comment.find(params[:id])
    # end

    private

    def comment_params
        params.require(:comment).permit(:comment, :created_at, :post_id)
    end

end