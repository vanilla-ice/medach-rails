class Api::BlogsController < Api::ArticlesController
  protected
    def type_class
      BlogArticle
    end

    def serializer
      SingleBlogArticleSerializer
    end
end
