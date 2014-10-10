class PagesController < ApplicationController

 
  #layout :get_layout
  
  # before_filter :find_page, :except => [:new, :show, :create]
  # before_filter :find_body, :only => [:edit]
  def index
   @pages = current_user.pages.order_by_created_at.paginate(page: params[:page], per_page: 10)
  end
  
  def show
   @page = Page.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @page = Page.new
  end

  def edit
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
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to @page
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
    params.require(:page).permit(:name, :title, :content, :user)
  end
  
end