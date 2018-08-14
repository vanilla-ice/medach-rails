class BlogsConfigSerializer < SiteConfigSerializer
  attributes :pinned, :spotlight, :main, :promoted

  def pinned
    prepare_articles('pinned_blogs')
  end

  def spotlight
    prepare_articles('spotlight_blogs')
  end

  def main
    prepare_articles('main_blogs')
  end

  def promoted
    prepare_articles('promoted_blogs')
  end
end
