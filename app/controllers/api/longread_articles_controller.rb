class Api::LongreadArticlesController < Api::ArticlesController
  protected
    def type_class
      LongreadArticle
    end
end