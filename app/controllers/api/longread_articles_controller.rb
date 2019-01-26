module Api
  class LongreadArticlesController < ArticlesController
    protected

    def type_class
      LongreadArticle
    end
  end
end
