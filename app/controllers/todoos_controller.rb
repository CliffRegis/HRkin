class TodoosController < ApplicationController

  def index
    @todos = Todoo.where(done: false)
    @todone = Todoo.where(done: true)
  end

  def new
    @todo = Todoo.new
  end

  def todo_params
    params.require(:todoo).permit(:name, :done)
  end

  def create
    @todo = Todoo.new(todo_params)
    if @todo.save
      redirect_to todoos_path, :notice => "Your todo item was created!"
    else
      render "new"
    end
  end

  def show
    @todo = Todoo.find(params[:id])
  end


  def update
    @todo = Todoo.find(params[:id])
    if @todo.update_attribute(:done, true)
      redirect_to todoos_path, :notice => "Your todo item was marked as done!"
    else
      redirect_to todoos_path, :notice => "Your todo item was not properly marked!"
    end
  end

  def destroy
    @todo = Todoo.find(params[:id])
    @todo.destroy
    
    redirect_to todoos_path, :notice => "Your todo was deleted"
   
  end
end