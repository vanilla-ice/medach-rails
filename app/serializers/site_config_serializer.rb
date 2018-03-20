class SiteConfigSerializer < ActiveModel::Serializer
  def serialize_article(article)
    ::MultipleArticleSerializer.new(article).as_json
  end

  def serialize_articles(articles)
    articles.map { |article| serialize_article(article) }
  end

  def populate_articles(articles_type)
    articles = object.data[articles_type].map do |article_id|
      Article.exists?(article_id) ? Article.find(article_id) : nil
    end
    articles.compact
  end

  def prepare_articles(articles_type)
    serialize_articles(populate_articles(articles_type))
  end
end