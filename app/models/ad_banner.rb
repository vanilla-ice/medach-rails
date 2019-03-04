class AdBanner < ApplicationRecord
  enum ad_type: [:google, :custom]
  enum ad_position: [:top, :bottom, :middle, :sidebar]
  enum article_type: Article::TYPES

  attr_accessor :blog_ids, :case_ids, :longread_ids, :media_ids, :news_ids

  validates :ad_type, :ad_position, :article_type, presence: true
end
