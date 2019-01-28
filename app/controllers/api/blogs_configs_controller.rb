module Api
  class BlogsConfigsController < BaseController
    def index
      render(
        json: BlogsConfig.active.first || {},
        key_transform: :camel_lower
      )
    end
  end
end
