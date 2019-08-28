# frozen_string_literal: true

module ActiveAdmin::SearchHelper
  include Rails.application.routes.url_helpers

  def search_route_for(resource)
    case resource.class.name
    when 'BlogArticle'
      search_admin_blog_articles_path().to_s
    when 'CaseArticle'
      search_admin_case_articles_path().to_s
    when 'LongreadArticle'
      search_admin_longread_articles_path().to_s
    when 'MediaArticle'
      search_admin_media_articles_path().to_s
    when 'NewsArticle'
      search_admin_news_articles_path().to_s
    end
  end
end