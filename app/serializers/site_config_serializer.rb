class SiteConfigSerializer < ActiveModel::Serializer
  def serialize_article(article)
    ::MultipleArticleSerializer.new(article).as_json
  end

  def serialize_articles(articles)
    articles.map { |article| serialize_article(article) }
  end

  def populate_articles(articles_type)
    ordered_article_ids = object.data["#{articles_type}_order"]
    article_ids = object.data[articles_type]
    ids = article_ids.sort == ordered_article_ids.sort ? ordered_article_ids : article_ids
    Article.includes(:tags).where(id: ids).sort_by { |article| ids.index(article.id) }.reverse
  end

  def prepare_articles(articles_type)
    serialize_articles(populate_articles(articles_type))
  end
end
