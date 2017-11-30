class Image < ApplicationRecord
  # belongs_to :article
  mount_uploader :url, ImageUploader
end
