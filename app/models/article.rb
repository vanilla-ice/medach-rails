class Article < ApplicationRecord
  include PgSearch
  multisearchable :against =>[:body, :title, :author, :infographic, :redaction, :shorttext]
  pg_search_scope :search, :against => [:body, :title, :author, :infographic, :redaction, :shorttext],
                             :using => {
                               :tsearch => {:dictionary => "russian", :prefix => true}
                              }
  mount_uploader :image, ImageUploader
  acts_as_taggable
  scope :published, -> { where(["publish_on < ?", Time.zone.now]) }
end
