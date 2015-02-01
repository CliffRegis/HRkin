class WallsController < ApplicationController
     
  def show
    @friends = current_user.followings
    @posts = Post.where(user_id: current_user.friends.pluck(:id))
    
  end
end
  


