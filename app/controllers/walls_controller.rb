class WallsController < ApplicationController
   
  
  def show
   
   @friends = current_user.followings
   @posts = Post.reverse_relationships current_user.followers
   @user_name = @user_id
  end

  
end
