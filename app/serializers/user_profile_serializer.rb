class UserProfileSerializer < ActiveModel::Serializer
  attributes :avatar, :instagram_account, :facebook_account, :telegram_account, :about, :cover_image
end
