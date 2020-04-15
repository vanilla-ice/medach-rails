class VacancySerializer < ActiveModel::Serializer
  attributes :id, :title, :employer, :location, :experience, :salary, :contacts, :external_url, :content, :is_promoted
end