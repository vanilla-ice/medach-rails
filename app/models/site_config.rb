class SiteConfig < ApplicationRecord

  scope :active, -> { where(active: true).order("created_at DESC") }
  def data_value(key)
    data ? data[key] || [] : []
  end

  # ARTICLES
  def promoted_articles
    data_value('promoted_articles')
  end

  def pinned_articles
    data_value('pinned_articles')
  end

  # BLOGS
  def promoted_blogs
    data_value('promoted_blogs')
  end

  def pinned_blogs
    data_value('pinned_blogs')
  end
end
