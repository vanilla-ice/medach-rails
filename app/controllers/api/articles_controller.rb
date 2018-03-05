class Api::ArticlesController < ActionController::Base
  respond_to  :json
  def index
    articles = Article.published
    paginated = articles.page(params[:page]).per(20)
    render json: {
      articles: paginated.newest_first,
      count: articles.count
    }
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

  def tags_count
    @tags_count = ActsAsTaggableOn::Tag.most_used
    render json: @tags_count
  end

  def search
    @articles = Article.search(params[:q])
    render json: @articles
  end

  def show_fixed
   @articles = Article.fixed
   render json: @articles
  end
 
  private
    def article_params
      [:cover_image, :avatar]
    end

end