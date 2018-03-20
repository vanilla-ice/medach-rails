class BlogsConfigSerializer < SiteConfigSerializer
  attributes(
    :pinned_blogs,
    :spotlight_blogs,
    :main_blogs,
    :promoted_blogs
  )

  def pinned_blogs
    prepare_articles('pinned_blogs')
  end
  def spotlight_blogs
    prepare_articles('spotlight_blogs')
  end
  def main_blogs
    prepare_articles('main_blogs')
  end
  def promoted_blogs
    prepare_articles('promoted_blogs')
  end
end
