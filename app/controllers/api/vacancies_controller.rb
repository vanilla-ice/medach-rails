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
      render json: { message: e.message }
    end

    def subscribe
      @subscriber = Subscriber.new(subscribe_params.merge(is_subscribed: true))
      if @subscriber.save
        render json: @subscriber
      else
        render json: @subscriber.errors, status: :unprocessable_entity
      end
    rescue => e 
      render json: { message: e.message }
    end

    def unsubscribe
      @subscriber = Subscriber.find(params[:subscriber_id])
      if @subscriber.update(is_subscribed: false)
        render json: @subscriber
      else
        render json: @subscriber.errors, status: :unprocessable_entity
      end
    rescue => e
      render json: { message: e.message }
    end

    private

    def vacancy_params
      params.permit(
        :title,
        :employer,
        :location,
        :experience,
        :salary,
        :contacts,
        :external_url,
        :content
      )
    end

    def subscribe_params
      params.permit(
        :email
      )
    end
  end
end
