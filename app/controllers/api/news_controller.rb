module Api
  class NewsController < ArticlesController
    protected
    def type_class
      NewsArticle
    end
  end
end
