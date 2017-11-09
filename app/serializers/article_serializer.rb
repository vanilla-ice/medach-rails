class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :body, :image, :title, :author, :infographic, :redaction, :created_at, :tag_list

  def tag_list
    object.tag_list
  end


end