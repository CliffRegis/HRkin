class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.build(comment_params)
    @comments = @post.comments
    @comment.post_id = @post.id
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

  def comment_params
    params.require(:comment).permit(:user_id, :id, :username, :name, :title, :post_id, :content)
  end

end
