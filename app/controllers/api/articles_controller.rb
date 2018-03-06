class Api::ArticlesController < ActionController::Base
  respond_to :json

  def index
    @articles = type_class.published
    if params[:tag]
      @articles = type_class.published.tagged_with(params[:tag])
    elsif params[:query]
      @articles = type_class.published.search(params[:query])
    end
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
        json: { errors: [ { message: "#{root_key_single} with id=#{params[:id]} not found" } ] },
        status: 404
      )
    else 
      @article = type_class.find(params[:id])
      render json: @article, serializer: serializer, root: root_key_single, key_transform: :camel_lower
    end
  end

  def show_fixed
   @articles = type_class.fixed
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
end