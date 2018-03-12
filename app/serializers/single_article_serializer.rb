class SingleArticleSerializer < BaseArticleSerializer
  attributes(
    :body,
    :author,
    :infographic,
    :redaction,
    :publish_on,
    :short_description,
    :origin,
    :translate
  )

  def id
    object.id.to_s
  end

end
