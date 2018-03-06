class SingleArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :tags, :body, :cover_image, :author, :infographic, :redaction, :publish_on, :short_description, :origin, :translate, :fixed

  def tags
    object.tag_list
  end

end
