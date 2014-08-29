 class PostsController < ApplicationController
 
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new
    
  end

  def edit
    @post = Post.find(params[:id])
   
  end

  def create

    @post = Post.new(params.require(:post).permit(:title, :image, :content))

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
   
    if @post.update(params.require(:post).permit(:title, :content))
      flash[:notice] = "Post was updated."
      redirect_to posts_path
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end