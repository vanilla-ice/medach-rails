class BlogArticle < Article
  belongs_to :creator, class_name: 'User'

  def author
    creator.present? ? creator : read_attribute(:author)
  end
end
