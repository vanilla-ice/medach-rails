class Api::ArticlesController < ActionController::Base
  respond_to  :json
  def index
    @articles = Article.all
    render json: @articles
  end


  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def get_by_tag
      @articles = Article.tagged_with(params[:tag_name]) 
    if @articles.any?
      render json: @articles
    else
      render :json => {:message => "TAG NAME NOT FOUND"} 
    end
  end

end