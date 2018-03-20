class BlogsConfig < SiteConfig
  def pinned_blogs
    data_value('pinned_blogs')
  end

  def spotlight_blogs
    data_value('spotlight_blogs')
  end

  def main_blogs
    data_value('main_blogs')
  end

  def promoted_blogs
    data_value('promoted_blogs')
  end
end
