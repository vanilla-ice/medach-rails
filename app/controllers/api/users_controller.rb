class Api::UsersController < ActionController::Base
  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else
      head 404
    end
  end
end
