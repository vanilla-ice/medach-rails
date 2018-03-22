class Api::MediaArticlesController < Api::ArticlesController
  protected
    def type_class
      MediaArticle
    end

    def root_key_single
      'media'
    end

    def root_key_multiple
      'media'
    end
end