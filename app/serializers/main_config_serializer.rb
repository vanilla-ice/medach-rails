class MainConfigSerializer < SiteConfigSerializer
  attributes(
    :pinned_articles,
    :pinned_blogs,
    :main_news,
    :promoted_articles
  )

  def pinned_articles
    prepare_articles('pinned_articles')
  end
  def pinned_blogs
    prepare_articles('pinned_blogs')
  end
  def main_news
    prepare_articles('main_news')
  end
  def promoted_articles
    prepare_articles('promoted_articles')
  end
end
