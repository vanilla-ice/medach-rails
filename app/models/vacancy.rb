class Vacancy < ApplicationRecord
  scope :approved, -> { where(is_approved: true) }
end
