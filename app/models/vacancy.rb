class Vacancy < ApplicationRecord
  has_many :vacancy_responses

  scope :approved, -> { where(is_approved: true) }
end
