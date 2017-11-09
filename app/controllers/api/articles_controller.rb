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

  def by_tag
      @articles = Article.tagged_with(params[:tag_name])
    if @articles.any?
      render json: @articles
    else
      render :json => {:message => "TAG NAME NOT FOUND"}
    end
  end

  def all_tags
    @all_tags = ActsAsTaggableOn::Tag.all
    render json: @all_tags
  end

end