class CommentsController < ApplicationController
  respond_to :html, :js
  before_filter :load_commentable
  
  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice:'Comment was saved'
    else
      flash[:alert] = 'Comment failed'
      redirect_to :back
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
   
   def nil.name
    "John Doe"

    end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :id, :username, :name, :title, :todoo_id, :post_id, :content, :commentable_id, :commentable_type)
  end

  def load_commentable
    @klass = [Post, Todoo, Page].detect {|c| params["#{c.name.underscore}_id"]}
    @commentable = @klass.find(params["#{@klass.name.underscore}_id"])
  end
  
  # def load_commentable
  #   resource, id = request.path.split('/')[1,2]
  #   @commentable = resource.singularize.classify.constantize.find(id)
  # end
  
end
