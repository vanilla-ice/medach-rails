class Api::ArticlesController < ActionController::Base
  respond_to :json

  impressionist :actions => [:show]

  def index
    @articles = type_class.published.filter(index_params.except(:sort)).sort_query(sort_params)
    @articles = @articles.tagged_with(['перевод'], exclude: true) if type_class == LongreadArticle

    paginated = @articles.page(params[:page]).per(20)
    render(
      json: paginated,
      each_serializer: each_serializer,
      root: root_key_multiple,
      key_transform: :camel_lower,
      meta: meta_attributes(paginated)
    )
  end

  def show
    unless type_class.exists?(params[:id])
      render(
        json: { errors: [ { message: "#{type_class.model_name.human} с id = #{params[:id]} не найден" } ] },
        status: 404
      )
    else
      @article = type_class.find(params[:id])
      impressionist(@article)
      render json: @article, serializer: serializer, root: root_key_single, key_transform: :camel_lower
    end
  end

  def show_fixed
   @articles = type_class.fixed
   render json: @articles
  end

  def show_random
    @articles = type_class.order('RANDOM()').limit(params[:limit] || 3)
    render json: @articles
  end

  def meta_attributes(collection, extra_meta = {})
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page, # use collection.previous_page when using will_paginate
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }.merge(extra_meta)
  end

  def all
    @articles = Article.published.filter(index_params.except(:sort)).sort(sort_params)

    paginated = @articles.page(params[:page]).per(20)
    render(
      json: paginated,
      each_serializer: BaseArticleSerializer,
      root: 'all_articles',
      key_transform: :camel_lower,
      meta: meta_attributes(paginated)
    )
  end

  def translated
    @articles = type_class.published.tagged_with(['перевод'])
    paginated = @articles.page(params[:page]).per(20)

    render(
      json: paginated,
      each_serializer: each_serializer,
      root: root_key_multiple,
      key_transform: :camel_lower,
      meta: meta_attributes(paginated)
    )
  end

  protected

  def type_class
    Article
  end

  def serializer
    SingleArticleSerializer
  end

  def each_serializer
    MultipleArticleSerializer
  end

  def root_key_single
    'article'
  end

  def root_key_multiple
    'articles'
  end

  def index_params
    params.permit(
      :tag,
      :query,
      sort: [
        :col,
        :dir
      ]
    )
  end

  def sort_params
    index_params[:sort].to_h.reverse_merge(col: :publish_on, dir: :desc)
  end
end
