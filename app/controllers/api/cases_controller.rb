module Api
  class CasesController < ArticlesController
    protected

    def type_class
      CaseArticle
    end
  end
end
