class Api::BlogsConfigsController < ActionController::Base
  def index
    render(
      json: BlogsConfig.active.first || {blogsConfig: {pinnedBlogs: [], spotlightBlogs: [], mainBlogs: [], promotedBlogs: []}},
      root: 'blogs_config',
      key_transform: :camel_lower
    )
  end
end