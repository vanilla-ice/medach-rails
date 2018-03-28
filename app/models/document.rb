class Document < ApplicationRecord
  mount_uploader :url, FileUploader
end
