class VacancyResponse < ApplicationRecord
  belongs_to :document, optional: true
  belongs_to :vacancy

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :phone, :with => /\A\+\d{11}\z/i
end
