class Banner < ApplicationRecord
	belongs_to :article

	validates :article_id, presence: true
	validates :title, presence: true
	validates :url, presence: true
	validates :description, presence: true
end
