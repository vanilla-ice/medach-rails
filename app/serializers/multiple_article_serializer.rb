class MultipleArticleSerializer < ActiveModel::Serializer
  attributes :id, :fixed, :cover_image, :title

  def id
    object.id.to_s
  end
end
