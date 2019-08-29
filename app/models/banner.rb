class Banner < ApplicationRecord
	belongs_to :article
	
	enum positions: {
		top: "top",
		right: "right",
		bottom: "bottom",
		left: "left",
		in_text: "in_text"
	}

	validates :title, presence: true
	validates :url, presence: true
	validates :description, presence: true
	validates :image, presence: true
	validates :position, presence: true

	mount_uploader :image, BannerUploader
end
