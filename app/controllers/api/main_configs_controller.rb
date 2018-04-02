class Api::MainConfigsController < ActionController::Base
  def index
    render(
      json: MainConfig.active || [],
      each_serialize: MainConfigSerializer,
      root: 'main_config',
      key_transform: :camel_lower
    )
  end
end