class Api::ArticlesController < ActionController::Base
  respond_to  :json
  def index
    @articles = Article.all
    render json: @articles
  end


  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def get_by_tag
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:tag_name])
    if @tag
      @artiles = Article.tagged_with(@tag.name)
      render json: @articles
    else
      # render :json, message: "ERROR"
    end
  end

end