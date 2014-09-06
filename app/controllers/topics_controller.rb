class TopicsController < ApplicationController
  def index
    @topic = Topic.new
    @topics = Topic.paginate(page: params[:page], per_page: 10)
    
  end

  def new
    @topic = Topic.new
    
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
   
  end

  def edit
    @topic = Topic.find(params[:id])
    
  end

  def destroy
    @topic = Topic.find(params[:id])
    title = @topic.title
    

    if @topic.destroy
      flash[:notice] = "\"#{title}\" was deleted."
      redirect_to topics_path
    else
      flash[:error] = "Error with deleting topic. Please try again."
      render :show
    end
  end

  def create
    @topic = Topic.new(topic_params)
    
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end
   
  def update
    @topic = Topic.find(params[:id])
    
    if @topic.update_attributes(params.require(:topic).permit(:title, :id, :content))
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again"
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :topic_id, :id, :content)
  end
end
