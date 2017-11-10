class Article < ApplicationRecord
  include PgSearch
  pg_search_scope :search, :against => [:body, :title, :author, :infographic, :redaction],
                             :using => {
                               :tsearch => {:dictionary => "russian", :prefix => true}
                              }
  mount_uploader :image, ImageUploader
  acts_as_taggable
end
