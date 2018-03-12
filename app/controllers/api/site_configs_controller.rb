class Api::SiteConfigsController < ActionController::Base
  def index
    # site_config = SiteConfig.active.first
    # promoted_articles = site_config.data['promoted_articles'].map{ |article_id| LongreadArticle.find(article_id) }
    # pinned_articles = site_config.data['pinned_articles'].map{ |article_id| LongreadArticle.find(article_id) }
    # render json: {
    #   promotedArticles: promoted_articles,
    #   pinnedArticles: pinned_articles
    # }
    render(
      json: SiteConfig.active.first || {siteConfig: {pinnedArticles: [], promotedArticles: [], pinnedBlogs: [], promotedBlogs: []}},
      root: 'site_config',
      key_transform: :camel_lower
    )
  end
end