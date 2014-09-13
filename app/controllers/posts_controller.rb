class PostsController < ApplicationController
   def index
     @posts = Post.visible_to(current_user).where("posts.created_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10)
   end

   def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  
    @comments = @post.comments
    @comment = Comment.new
    @name = @post.username
    
  end
  
 end