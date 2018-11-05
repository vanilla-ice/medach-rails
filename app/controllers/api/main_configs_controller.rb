class Api::MainConfigsController < ActionController::Base
  def index
    render(
      json: MainConfig.active.first || {},
      key_transform: :camel_lower
    )
  end
end
