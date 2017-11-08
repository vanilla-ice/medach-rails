class ArticlesController < ActionController::Base
  def index
    @article = Article.all
  end

  # def new
  #   @article = Article.new
  # end

  def show
  end


end