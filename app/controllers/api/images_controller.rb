module Api
  class ImagesController < BaseController
    def create
      @image = Image.new(url: params[:image])
      if @image.save!
        render json: @image.url
      else
        render json: {ok: false}, status: 422
      end
    end
  end
end
