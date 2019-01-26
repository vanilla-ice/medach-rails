module Api
  class BlogsController < ArticlesController
    protected

    def type_class
      BlogArticle
    end

    def serializer
      SingleBlogArticleSerializer
    end
  end
end
