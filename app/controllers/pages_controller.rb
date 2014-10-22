class PagesController < ApplicationController
  before_filter :authenticate_user!
 

   #layout :get_layout
  
  # before_filter :find_page, :except => [:new, :show, :create]
  # before_filter :find_body, :only => [:edit]
  def index
    #if user_signed_in? 
    if current_user.present?
      @pages = current_user.pages.order_by_created_at.paginate(page: params[:page], per_page: 10)
    else
      print "Not working"
    end
  end

  
  def show
    if current_user.present? 
   @page = Page.find(params[:id])
  end
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
  @user.pages.build(page_params)
  if @user.save
    flash[:notice] = "Great! Your new Wiki was made"
    redirect_to user_pages_path(@user)
  else
    render :new
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