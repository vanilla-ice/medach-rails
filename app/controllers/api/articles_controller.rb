class Api::ArticlesController < ActionController::Base
  respond_to :json

  def index
    articles = type_class.published
    paginated = articles.page(params[:page]).per(20)
    render json: paginated, each_serializer: each_serializer, root: root_key_multiple, key_transform: :camel_lower, meta: meta_attributes(paginated)
  end

  def show
    @article = type_class.find(params[:id])
    render json: @article, serializer: serializer, root: root_key_single, key_transform: :camel_lower
  end

  def by_tag
    @articles = type_class.tagged_with(params[:tag_name])
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
    @articles = type_class.search(params[:q])
    render json: @articles, each_serializer: each_serializer, root: root_key_multiple, key_transform: :camel_lower
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