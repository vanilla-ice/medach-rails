module Api
  class UsersController < BaseController
    def show
      @user = User.find_by(id: params[:id])
      if @user
        render json: @user
      else
        head 404
      end
    end

    def bloggers
      @users = User.bloggers
      paginated = @users.page(params[:page]).per(params[:per_page] || 20)
      render(
        json: {
          collection: paginated,
          meta: meta_attributes(paginated)
        },
        serializer: UserCollectionSerializer,
        key_transform: :camel_lower
      )
    end
  end
end
