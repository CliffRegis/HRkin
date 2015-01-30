class CommentsController < ApplicationController
  respond_to :html, :js
  # before_filter :load_commentable
  
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.build(comment_params)
    # @comment.user = current_user
    if @comment.save
      redirect_to [@topic, @post], notice:'Comment was saved'
    else
      flash[:alert] = 'Comment failed'
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment was not removed."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post]}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :id, :username, :name, :title, :post_id, :content, :commentable_id, :commentable_type)
  end

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end




# class CommentsController < ApplicationController
#   respond_to :html, :js
  
  
#   def create
#     @post = Post.find(params[:post_id])
#     @topic = @post.topic
#     @comment = @post.comments.build(comment_params)
#     if @comment.save
#       redirect_to :back, notice:'Comment was saved'
#     else
#       flash[:alert] = 'Comment failed'
#       redirect_to [@topic, @post]
#     end

#   end

#   def destroy
#     @post = Post.find(params[:post_id])
#     @comment = @post.comments.find(params[:id])
    
#     if @comment.destroy
#       flash[:notice] = "Comment was removed."
#     else
#       flash[:error] = "Comment was not removed."
#     end

#     respond_with(@comment) do |format|
#       format.html { redirect_to [@post.topic, @post]}
#     end
#   end


#   private

#   def comment_params
#     params.require(:comment).permit(:user_id, :id, :username, :name, :title, :todoo_id, :post_id, :content, :commentable_id, :commentable_type)
#   end

    
# end
