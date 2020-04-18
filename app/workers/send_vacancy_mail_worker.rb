class SendVacancyMailWorker
  include Sidekiq::Worker

  VACANCY_PERIOD = (Time.now-7.days)..Time.now

  def perform(*args)
    subscribers.each do |sub|
      p "Email successfully sended to #{sub.email}" if VacancyMailer.with(subscriber: subscriber, vacancies: vacancies).vacancy_mailing.deliver_later
    end
  rescue StandardError => error
    p "Error: #{error.message}"
  end

  def subscribers
    @subscribers ||= Subscriber.subscribed
  end

  def vacancies
    @vacancies ||= Vacancy.approved.where(created_at: VACANCY_PERIOD).limit(10)
  end
end
