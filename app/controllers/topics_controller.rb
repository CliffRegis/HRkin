class TopicsController < ApplicationController
helper_method :sort_column, :sort_direction

  def index
   @topic = Topic.new
   @topics = Topic.paginate(page: params[:page], per_page: 10)
  end

  def new
    @topic = Topic.new
  end
  
  def show
    @topics = Topic.paginate(page: params[:page], per_page: 10)
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    if query = params[:search]
        @search = @posts.search do
       fulltext(query)
       with(:topic_id, params[:id])
       end
        @posts = @search.results
    end
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

    def sort_column
      Topic.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end


end