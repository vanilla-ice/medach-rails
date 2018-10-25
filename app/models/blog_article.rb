class BlogArticle < Article
  def author
    user.present? ? user : read_attribute(:author)
  end
end
