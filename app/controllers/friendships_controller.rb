class FriendshipsController < ApplicationController

  def create
    @user = User.find(params[:new_friend_id])
    if current_user.befriend(@user)
      redirect_to @user, notice: 'Befriended'
    else
      redirect_to :back, alert: 'Friending failed'
    end
  end

  def destroy
    @user = User.find(params[:old_friend_id])
  end
  
    
end