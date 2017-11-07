class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_taggable
end
