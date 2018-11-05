class Api::CasesController < Api::ArticlesController
  protected

  def type_class
    CaseArticle
  end
end
