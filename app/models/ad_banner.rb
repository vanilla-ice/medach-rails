class AdBanner < ApplicationRecord
  enum ad_type: [:google, :custom]
  enum ad_position: [:top, :bottom, :middle, :sidebar]
  enum article_type: Article::TYPES

  validates :ad_type, :ad_position, :article_type, presence: true
end
