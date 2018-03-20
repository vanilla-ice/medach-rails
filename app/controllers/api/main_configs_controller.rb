class Api::MainConfigsController < ActionController::Base
  def index
    render(
      json: MainConfig.active.first || { mainConfig: {pinnedArticles: [], pinnedBlogs: [], mainNews: [], promotedArticles: [] } },
      root: 'main_config',
      key_transform: :camel_lower
    )
  end
end