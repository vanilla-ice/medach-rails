module Api
  class MainConfigsController < BaseController
    def index
      render(
        json: MainConfig.active.first || {},
        key_transform: :camel_lower
      )
    end
  end
end
