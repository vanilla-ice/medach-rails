class UserProfile < ApplicationRecord
  belongs_to :user

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover_image, ImageUploader
end
