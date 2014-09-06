class UsersController < ApplicationController
  
 
  def index
     @users = User.all
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
    render "devise/registrations/edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
  end

 
  private
 
  def user_params
    params.require(:user).permit(:username, :avatar, :email_favorites)
  end
end
  