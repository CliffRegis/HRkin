class CollaborationsController < ApplicationController
  
  def index
    @collaborations = Collaboration.all
  end

  def new
    @Collaboration = Collaboration.new

  def create
    @page = Page.find(params[:id])
    @collaboration = Collaboration.new(user_id: params[:user_id], page_id: @page.id)
    if @collaboration.save
     redirect_to user_pages_path, notice: 'Supporter added'
    else
     redirect_to :back, alert: 'Supporter not added'
    end 
  end

  def show
    @collaboration = Collaboration.find(params[:page])
  end

  def destroy
    @page = Page.find(params[:page_id])
    @collaboration = Collaboration.find(params[:id])
    @collaboration.destroy
    redirect_to user_pages_path
  end

end