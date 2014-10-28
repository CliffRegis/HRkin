class CollaborationsController < ApplicationController
  
  def index
    @collaborators = Collaborator.all
  end

  def create
    @user = User.find(params[:supported_id])
    if current_user.support!(@user)
     redirect_to @user, notice: 'Supporter added'
    else
     redirect_to :back, alert: 'Supporter not added'
    end 
  end

  def destroy
    @user = Collaboration.find(params[:id]).supported
    current_user.unsupport!(@user)
    redirect_to @user
  end

end