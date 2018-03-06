class Api::NewsArticlesController < Api::ArticlesController
  protected
    def type_class
      NewsArticle
    end
end