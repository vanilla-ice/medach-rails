class BlogsConfig < SiteConfig
  scope :active, -> { where(active: true).order("updated_at DESC") }

  def pinned_blogs
    data_value('pinned_blogs')
  end

  def pinned_blogs_order
    data_value('pinned_blogs_order').join(', ')
  end

  def spotlight_blogs
    data_value('spotlight_blogs')
  end

  def spotlight_blogs_order
    data_value('spotlight_blogs_order').join(', ')
  end

  def main_blogs
    data_value('main_blogs')
  end

  def main_blogs_order
    data_value('main_blogs_order').join(', ')
  end

  def promoted_blogs
    data_value('promoted_blogs')
  end

  def promoted_blogs_order
    data_value('promoted_blogs_order').join(', ')
  end
end
