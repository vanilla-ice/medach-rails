class UserCollectionSerializer < ActiveModel::Serializer
  attributes :collection, :meta

  def collection
    object[:collection].map do |item|
      UserSerializer.new(item)
    end
  end

  def meta
    object[:meta]
  end
end
