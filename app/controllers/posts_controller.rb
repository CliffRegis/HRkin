class PostsController < ApplicationController

 def index
   @posts = Post.visible_to(current_user).where("posts.created_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10)
 end

 def show
   @topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:id])
   @comments = @post.comments
   @comment = Comment.new
   @name = @post.username
 end
  
 end