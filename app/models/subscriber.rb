class Subscriber < ApplicationRecord
  validates_uniqueness_of :email
  
  scope :subscribed, -> { where(is_subscribed: true) }
end
