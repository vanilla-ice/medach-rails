class HomeController < ApplicationController
  def index
    @rich_preview = get_rich_preview_data
  end

  private
  def default_rich_preview
    default_value = {
      image: ApplicationController.helpers.asset_path('logo.png'),
      url: request.original_url,
      title: "Medach",
      description: "Medach",
      keywords: [].join(" ")
    }
  end

  def get_url
    route_array = request.fullpath.split('/').reject { |c| c.empty? }
    '/' + (route_array[0] || '')
  end

  def get_id
    route_array = request.fullpath.split('/').reject { |c| c.empty? }
    route_array[1]
  end

  def get_rich_preview_data
    @page = get_url
    @id = get_id
    default_value = default_rich_preview
    if @id && @page != '/tag' && Article.exists?(@id) then
      article = Article.find(@id)
      default_value[:title] = article.title
      default_value[:description] = article.short_description
      default_value[:image] = article.cover_image.url
    elsif PageMeta.exists?(:url => @page)
      page_meta = PageMeta.find_by(url: @page)
      default_value[:title] = page_meta.title
      default_value[:description] = page_meta.description
      default_value[:keywords] = page_meta.keywords
    end
    default_value
  end

end
