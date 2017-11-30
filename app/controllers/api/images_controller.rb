class Api::ImagesController < ActionController::Base
  respond_to  :json
  def create
      @image = Image.new(url: params[:image])
    if @image.save!
      render json: @image.url
    else
      render json: {ok: false}, status: 422
    end
  end

end