module Api
  class UsersController < BaseController
    swagger_controller :users, "Users management"

    swagger_api :bloggers do
      summary 'Fetches all bloggers'
      param :query, :page, :integer, :optional, "Page number"
      param :query, :per, :integer, :optional, "Records per page number"
    end

    swagger_api :show do
      summary 'Fetches a single user'
      param :path, :id, :integer, :required, "User ID"
      response :not_found
    end

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
