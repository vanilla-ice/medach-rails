class Api::NewsController < Api::ArticlesController
  protected
    def type_class
      NewsArticle
    end
end
