class MainConfigSerializer < SiteConfigSerializer
  attributes :pinned, :blogs, :news, :promoted, :slider

  def pinned
    prepare_articles('pinned_articles')
  end

  def blogs
    prepare_articles('pinned_blogs')
  end

  def news
    prepare_articles('main_news')
  end

  def promoted
    prepare_articles('promoted_articles')
  end

  def slider
    prepare_articles('slider_articles')
  end
end
