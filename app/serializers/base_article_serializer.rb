class BaseArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :tags, :cover_image, :views

  def id
    object.id.to_s
  end

  def views
    object.impressions_count
  end

  def tags
    object.tag_list
  end

end