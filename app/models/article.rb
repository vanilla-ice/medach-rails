class Article < ApplicationRecord
  include PgSearch

  is_impressionable :counter_cache => true, :unique => :all

  validates :short_description, length: { maximum: 250 }

  has_many :images

  before_save :delete_whitespace

  acts_as_ordered_taggable
  mount_uploader :cover_image, ImageUploader
  mount_uploader :avatar, AvatarUploader
  mount_uploader :small_cover_image, SmallCoverImageUploader

  scope :fixed, -> { where(fixed: true)}
  scope :published, -> { where(["publish_on < ?", Time.zone.now]).order("publish_on DESC") }
  scope :newest_first, -> {order("created_at DESC")}

  multisearchable against: [:body, :title, :author, :infographic, :redaction, :short_description, :translate, :origin]
  pg_search_scope :search,
    against: [:body, :title, :author, :infographic, :redaction, :short_description, :origin, :translate],
    associated_against: { :tags => [:name] },
    using: {
      tsearch: {dictionary: "russian", prefix: true}
    }

  def delete_whitespace
    self.tag_list = self.tag_list.map {|s| s.gsub(/(\#|\s)/, '')}
    self
  end

  def self.article_types
    %w(LongreadArticle BlogArticle NewsArticle)
  end

  def tag_string=(value)
    self.tag_list = value
  end

  def tag_string
    self.tag_list.join(', ')
  end

end
