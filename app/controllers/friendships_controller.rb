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
    if current_user.unfriend(@user)
      redirect_to @user, notice: 'Unfriended'
    else
      redirect_to @user, alert: 'Unfriending failed'
    end
  end
  
    
end