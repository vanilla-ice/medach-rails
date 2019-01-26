module Api
  class DocumentsController < ApiContoller
    respond_to  :json
    def create
      @document = Document.new(url: params[:document])
      if @document.save!
        render json: @document.url
      else
        render json: {ok: false}, status: 422
      end
    end
  end
end
