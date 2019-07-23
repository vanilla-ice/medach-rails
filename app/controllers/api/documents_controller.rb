module Api
  class DocumentsController < BaseController
    respond_to  :json
    def create
      if file_params.count > 1
        response = []
        file_params.each_with_index do |file, i|
          @document = Document.new(url: file)
          if @document.save!
            name = @document&.name.present?  ? @document.name : /[^\/]+$/.match(@document.url.url).to_s
            hs = { "file-#{i+1}".to_sym => { url: @document.url.url, name: name, id: @document.id } }
            response << hs
          else
            render json: { ok: false }, status: 422
          end
        end

        render json: response
      else
        @document = Document.new(url: file_params.last)
        if @document.save!
          name = @document&.name.present?  ? @document.name : /[^\/]+$/.match(@document.url.url).to_s
          render json: { file: {url: @document.url.url, name: name, id: @document.id } }
        else
          render json: { ok: false }, status: 422
        end
      end
    end

    private

    def file_params
      params.require(:file)
    end
  end
end
