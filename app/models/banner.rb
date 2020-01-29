class Banner < ApplicationRecord
	belongs_to :article

	enum positions: {
		left: "left",
		in_text: "in_text"
	}

	validates :url, presence: true
	validates :image, presence: true
	validates :position, presence: true

	mount_uploader :image, BannerUploader
end
