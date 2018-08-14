class Api::BlogsConfigsController < ActionController::Base
  def index
    render(
      json: BlogsConfig.active.first || {},
      key_transform: :camel_lower
    )
  end
end
