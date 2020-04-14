module Api
  class VacanciesController < BaseController
    def show
      @vacancy = Vacancy.find_by(id: params[:id])
      if @vacancy
        render json: @vacancy
      else
        head 404
      end
    end

    def index
      @vacancies = Vacancy.approved
      paginated = @vacancies.page(params[:page]).per(params[:per_page] || 20)
      render(
        json: {
          collection: paginated,
          meta: meta_attributes(paginated)
        },
        serializer: VacancyCollectionSerializer,
        key_transform: :camel_lower
      )
    end

    def create
      @vacancy = Vacancy.new(vacancy_params)
      if @vacancy.save
        render json: @vacancy
      else
        render json: @vacancy.errors, status: :unprocessable_entity
      end
    rescue => e
      render json: {message: e.message}
    end

    private

    def vacancy_params
      params.require(:vacancy).permit(
        :title,
        :employer,
        :location,
        :experience,
        :contacts,
        :external_url,
        :content
      )
    end
  end
end
