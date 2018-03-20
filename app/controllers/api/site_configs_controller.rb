class Api::SiteConfigsController < ActionController::Base
  def index
    render(
      json: SiteConfig.active.first || {siteConfig: {pinnedArticles: [], promotedArticles: [], pinnedBlogs: [], promotedBlogs: []}},
      root: 'site_config',
      key_transform: :camel_lower
    )
  end
end