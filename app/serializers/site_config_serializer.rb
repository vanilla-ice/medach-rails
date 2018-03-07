class SiteConfigSerializer < ActiveModel::Serializer
  attributes(
    :pinned_articles,
    :promoted_articles,
    :pinned_blogs,
    :promoted_blogs
  )

  def pinned_articles
    object.data['pinned_articles']
  end
  def promoted_articles
    object.data['promoted_articles']
  end
  def pinned_blogs
    object.data['pinned_blogs']
  end
  def promoted_blogs
    object.data['promoted_blogs']
  end
end