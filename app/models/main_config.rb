class MainConfig < SiteConfig
  scope :active, -> { where(active: true).order("updated_at DESC") }

  def pinned_articles
    data_value('pinned_articles')
  end

  def pinned_articles_order
    data_value('pinned_articles_order').join(', ')
  end

  def pinned_blogs
    data_value('pinned_blogs')
  end

  def pinned_blogs_order
    data_value('pinned_blogs_order').join(', ')
  end

  def main_news
    data_value('main_news')
  end

  def main_news_order
    data_value('main_news_order').join(', ')
  end

  def promoted_articles
    data_value('promoted_articles')
  end

  def promoted_articles_order
    data_value('promoted_articles_order').join(', ')
  end
end