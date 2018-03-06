class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :body, :cover_image, :title, :author, :infographic, :redaction, :created_at, :tag_list, :short_description, :origin, :translate, :fixed

  def tag_list
    object.tag_list
  end


end