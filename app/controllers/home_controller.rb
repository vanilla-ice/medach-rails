class HomeController < ApplicationController
  def index
    @rich_preview = get_rich_preview_data
  end

  private
  def get_rich_preview_data
    @path = request.fullpath.split('/').reject { |c| c.empty? }
    page = @path[0]
    id = @path[1]
    default_value = {
      url: request.original_url,
      title: "Medach",
      description: "Medach"
    }
    if id && Article.exists?(id) then
      article = Article.find(id)
      default_value[:title] = article.title
      default_value[:description] = article.short_description
      default_value[:image] = article.cover_image.url
    end
    default_value
  end

end
