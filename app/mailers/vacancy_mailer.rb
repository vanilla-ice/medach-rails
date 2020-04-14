class VacancyMailer < ApplicationMailer
  def vacancy_mailing
    @vacancies = params[:vacancies]
    @subscriber = params[:subscriber]
    mail_to = @subscriber.email
    mail(to: mail_to, subject: "Последние вакансии") 
  end
end
