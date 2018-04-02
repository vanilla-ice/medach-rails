class Api::BlogsConfigsController < ActionController::Base
  def index
    render(
      json: BlogsConfig.active || [],
      each_serialize: BlogsConfigSerializer,
      root: 'blogs_config',
      key_transform: :camel_lower
    )
  end
end