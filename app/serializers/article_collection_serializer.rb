class ArticleCollectionSerializer < ActiveModel::Serializer
  attributes :collection, :meta

  def collection
    object[:collection]. map do |item|
      BaseArticleSerializer.new(item)
    end
  end

  def meta
    object[:meta]
  end
end
