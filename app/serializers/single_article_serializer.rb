class SingleArticleSerializer < BaseArticleSerializer
  attributes(
    :body,
    :author,
    :user,
    :updater,
    :infographic,
    :redaction,
    :publish_on,
    :created_at,
    :updated_at,
    :short_description,
    :origin,
    :translate,
    :tags
  )

  def id
    object.id.to_s
  end

end
