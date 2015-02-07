class Topics::PostsController < ApplicationController
   
  def index
    @topic = Topic.new
    @topics = Topic.all
    @posts = Post.all
    @post = Post.find(params[:id])
      authorize @post
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @posts = @topic.posts
    @comments = @post.comments
    @comment = Comment.new  
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
      authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
      authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:image, :title, :id, :post_id, :image, :kind, :content))
    @post.topic = @topic
      authorize @post
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
      authorize @post
    if @post.update(params.require(:post).permit(:title, :image, :kind, :content))
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
      flash[:notice] = "post was deleted successfully"
      
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end

end