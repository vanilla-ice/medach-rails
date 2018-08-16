class Api::MediaController < Api::ArticlesController
  protected
    def type_class
      MediaArticle
    end
end
