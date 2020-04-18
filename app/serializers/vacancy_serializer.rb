class VacancySerializer < ActiveModel::Serializer
  attributes :id, :title, :employer, :location, :experience, :employment, :salary, :contacts, :external_url, :content, :is_promoted, :created_at, :updated_at
end