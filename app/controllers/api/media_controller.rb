module Api
  class MediaController < ArticlesController
    protected
    def type_class
      MediaArticle
    end
  end
end
