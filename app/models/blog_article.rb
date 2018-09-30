class BlogArticle < Article
  belongs_to :user

  def author
    user.present? ? user : read_attribute(:author)
  end
end
