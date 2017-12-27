class Article < ApplicationRecord
  include PgSearch
  multisearchable :against =>[:body, :title, :author, :infographic, :redaction, :shorttext, :translate, :origin]
  pg_search_scope :search, :against => [:body, :title, :author, :infographic, :redaction, :shorttext, :origin, :translate],
                             :using => {
                               :tsearch => {:dictionary => "russian", :prefix => true}
                              }
  mount_uploader :image, ImageUploader
  has_many :images
  acts_as_taggable
  scope :published, -> { where(["publish_on < ?", Time.zone.now]) }
  scope :newest_first, -> {order("created_at DESC")}
  before_save :delete_whitespace

  def delete_whitespace
    self.tag_list = self.tag_list.map {|s| s.gsub(/(\#|\s)/, '')}
    self
  end
end
