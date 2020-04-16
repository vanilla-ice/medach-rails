class VacancyResponse < ApplicationRecord
  belongs_to :document, optional: true
  belongs_to :vacancy
end
