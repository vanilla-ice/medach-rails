class Api::NewsArticlesController < Api::ArticlesController
  protected
    def type_class
      NewsArticle
    end

    def root_key_single
      'news'
    end

    def root_key_multiple
      'news'
    end
end