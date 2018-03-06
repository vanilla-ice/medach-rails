class Api::ArticlesController < ActionController::Base
  respond_to :json

  def index
    articles = article_type_class.published
    paginated = articles.page(params[:page]).per(20)
    render json: paginated, each_serializer: multiple_article_serializer, root: root_key_multiple, key_transform: :camel_lower, meta: meta_attributes(paginated)
  end

  def show
    @article = article_type_class.find(params[:id])
    render json: @article, serializer: single_article_serializer, root: root_key_single, key_transform: :camel_lower
  end

  def by_tag
    @articles = article_type_class.tagged_with(params[:tag_name])
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
    @articles = article_type_class.search(params[:q])
    render json: @articles, each_serializer: multiple_article_serializer, root: root_key_multiple, key_transform: :camel_lower
  end

  def show_fixed
   @articles = article_type_class.fixed
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

  private
    # STI helper methods
    def set_article_type
      @article_type = article_type
    end

    def article_type
      Article.article_types.include?(params[:type]) ? params[:type] : "Article"
    end

    def article_type_class
      article_type.constantize
    end

    # STI helpers for serializer
    def single_article_serializer
      serializers = {
        LongreadArticle: SingleArticleSerializer,
        BlogArticle: SingleBlogArticleSerializer,
        NewsArticle: SingleArticleSerializer
      }
      serializers[article_type.to_sym]
    end

    def multiple_article_serializer
      serializers = {
        LongreadArticle: MultipleArticleSerializer,
        BlogArticle: MultipleArticleSerializer,
        NewsArticle: MultipleArticleSerializer
      }
      serializers[article_type.to_sym]
    end

    def root_key_single
      root_keys = {
        LongreadArticle: 'article',
        BlogArticle: 'blog',
        NewsArticle: 'news'
      }
      root_keys[article_type.to_sym]
    end

    def root_key_multiple
      root_keys = {
        LongreadArticle: 'articles',
        BlogArticle: 'blogs',
        NewsArticle: 'news'
      }
      root_keys[article_type.to_sym]
    end


end