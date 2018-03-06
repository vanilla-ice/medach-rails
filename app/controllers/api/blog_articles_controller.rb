class Api::BlogArticlesController < Api::ArticlesController
  protected
    def type_class
      BlogArticle
    end

    def serializer
      SingleBlogArticleSerializer
    end

    def root_key_single
      'blog'
    end

    def root_key_multiple
      'blogs'
    end
end
