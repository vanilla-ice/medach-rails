class BaseArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :tags, :cover_image, :small_cover_image, :views, :publication_date, :author, :type,
             :short_description, :slider_image

  def id
    object.id.to_s
  end

  def views
    object.impressions_count
  end

  def tags
    object.tags.collect { |t| t.name }
  end

  def cover_image
    { url: object.cover_image.url }
  end

  def small_cover_image
    { url: object.small_cover_image.url }
  end

  def slider_image
    url = object.slider_image.url || object.cover_image.url
    { url: url }
  end

  def publication_date
    object.publish_on
  end

  def type
    case object.type
    when 'LongreadArticle'
      'Article'
    when 'BlogArticle'
      'Blog'
    when 'NewsArticle'
      'News'
    when 'Article'
      'BaseArticle'
    when 'MediaArticle'
      'Media'
    else
      object.type
    end
  end

end
