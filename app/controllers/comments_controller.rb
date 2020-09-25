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
         @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
        
        #redirect_to post_path(@post) 
        redirect_back(fallback_location: root_path)


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
        #redirect_to post_path(@post)
        redirect_back(fallback_location: root_path)
    end

    def edit
     @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      session[:return_to] ||= request.referer
    end

    def update
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])

      if @comment.update(comment_params)
        
        redirect_to session.delete(:return_to)
        #redirect_to post_path(@post)
        #redirect_to user_path(@post.user_id)
      else
        render 'edit'
      end
    end

    # def show
    #     @comment = Comment.find(params[:id])
    # end

    private

    def comment_params
        params.require(:comment).permit(:comment, :created_at, :post_id)
    end

end