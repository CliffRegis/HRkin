class Topics::PostsController < ApplicationController
   
  def index
     @posts = Post.all
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new  
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :id, :post_id, :image, :kind, :content))
    @post.topic = @topic
    
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
   
    if @post.update(params.require(:post).permit(:title, :kind, :content))
      flash[:notice] = "Post was updated."
      redirect_to topic_post_path
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @topic = @post.topic
    title = @post.title
    authorize @post
    if @post.destroy
      #flash[:notice] = "post was deleted successfully"
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end

end