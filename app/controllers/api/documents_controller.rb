module Api
  class DocumentsController < BaseController
    respond_to  :json
    def create
      @document = Document.new(url: params[:document])
      if @document.save!
        render json: { filekey: { url: @document.url, name: @document.name, id: @document.id } }
      else
        render json: { ok: false }, status: 422
      end
    end
  end
end
