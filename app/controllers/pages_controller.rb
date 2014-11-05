class PagesController < ApplicationController
  #before_filter :authenticate_user!
  

  def index
    @pages = current_user.pages.order_by_created_at.paginate(page: params[:page], per_page: 10)
  end
  
  def show
    @page = Page.find(params[:id])
    @users = User.all
  end

  def new
    @user = User.find(params[:user_id])
    @page = Page.new
  end

  def edit
    @user = User.find(params[:user_id])
    @page = Page.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @page = @user.pages.build(page_params)

    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to [current_user, @page]
    else
      render :action => 'new'
    end
  end

  def update
    @page = Page.find(params[:id])
    # binding.pry
    if @page.update_attributes(page_params)
      flash[:notice] = "Successfully updated page."
      redirect_to user_page_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
  end
  
  def preview
    render :text => @page.preview(params[:data])
  end

  
  private

  def page_params
    params.require(:page).permit(:name, :title, :content, :user, :user_ids => [])
  end
  
end