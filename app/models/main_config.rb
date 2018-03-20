class MainConfig < SiteConfig
  def pinned_articles
    data_value('pinned_articles')
  end

  def pinned_blogs
    data_value('pinned_blogs')
  end

  def main_news
    data_value('main_news')
  end

  def promoted_articles
    data_value('promoted_articles')
  end
end