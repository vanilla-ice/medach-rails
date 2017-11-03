class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
end
