class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :blogs, class_name: 'BlogArticle'

  accepts_nested_attributes_for :user_profile, allow_destroy: false

  #after_create :init_profile

  scope :bloggers, -> { where(admin: false) }

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def init_profile
    create_user_profile
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end
end
