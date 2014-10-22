class UsersController < ApplicationController
  
  def index
     @title = "All users"
     @users = User.paginate(:page => params[:page])
     @collaborators = Collaborator.all
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
    @pages = @user.pages
    @comments = @user.comments
    @friends_post = @posts
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Friend(s)"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
 
  private
 
  def user_params
    params.require(:user).permit(:username, :avatar, :email_favorites)
  end
end
  