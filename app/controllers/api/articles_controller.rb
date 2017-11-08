class Api::ArticlesController < ActionController::Base
  respond_to  :json
  def index
    @articles = Article.all
    render json: @articles, include
  end


  def show
    @article = Article.find(params[:id])
    render json: @article
  end


end