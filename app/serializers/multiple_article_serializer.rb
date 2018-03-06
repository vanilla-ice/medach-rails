class MultipleArticleSerializer < ActiveModel::Serializer
  attributes :id, :fixed, :cover_image, :title
end
