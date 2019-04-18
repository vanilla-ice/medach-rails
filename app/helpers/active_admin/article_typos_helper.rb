# frozen_string_literal: true

module ActiveAdmin::ArticleTyposHelper
  include Rails.application.routes.url_helpers

  def admin_route_for(resource)
    case resource.class.name
    when 'BlogArticle'
      admin_blog_article_path(resource)
    when 'CaseArticle'
      admin_case_article_path(resource)
    when 'LongreadArticle'
      admin_longread_article_path(resource)
    when 'MediaArticle'
      admin_media_article_path(resource)
    when 'NewsArticle'
      admin_news_article_path(resource)
    end
  end
end
