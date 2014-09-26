class WallsController < ApplicationController
   
  
  def show
   
   @friends = current_user.followings
   @posts = Post.reverse_relationships current_user.followers

 end

end

#/posts/:post_id
#/users/:user_id/