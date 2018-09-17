class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :first_name, :last_name, :email, :created_at

  has_one :user_profile
end
