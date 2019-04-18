class RelatedArticleSerializer < ActiveModel::Serializer
    attributes :id, :title, :tags, :cover_image

    def tags
        object.tags.collect { |t| t.name }
    end

    def cover_image
        { url: object.cover_image.url }
    end
end