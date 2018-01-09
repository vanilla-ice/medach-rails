class Article < ApplicationRecord
  include PgSearch

  has_many :images

  before_save :delete_whitespace

  acts_as_taggable
  mount_uploader :image, ImageUploader

  scope :fixed, -> { where(fixed: true) }
  scope :published, -> { where(["publish_on < ?", Time.zone.now]) }
  scope :newest_first, -> {order("created_at DESC")}

  multisearchable against: [:body, :title, :author, :infographic, :redaction, :shorttext, :translate, :origin]
  pg_search_scope :search,
    against: [:body, :title, :author, :infographic, :redaction, :shorttext, :origin, :translate],
    using: {
      tsearch: {dictionary: "russian", prefix: true}
    }

  def delete_whitespace
    self.tag_list = self.tag_list.map {|s| s.gsub(/(\#|\s)/, '')}
    self
  end
end
