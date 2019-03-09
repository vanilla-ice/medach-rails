class AdBanner < ApplicationRecord
  has_many :ad_banners_articles, dependent: :destroy
  has_many :ad_banners, through: :ad_banners_articles

  accepts_nested_attributes_for :ad_banners_articles, allow_destroy: true

  enum ad_type: [:google, :custom]
  enum ad_position: [:top, :bottom, :middle, :sidebar]
  enum article_type: Article::TYPES

  attr_accessor :article_ids

  validates :ad_type, :ad_position, :article_type, presence: true

  before_save :set_articles

  mount_uploader :image, BannerImageUploader

  private

  def set_articles
    old_references = ad_banners_articles.reject { |aa| aa.new_record? }
    old_references.map { |ref| ref.destroy }

    if ad_banners_articles.select { |aa| aa.new_record? }.blank?
      article_type_ids = article_type.constantize.all.pluck(:id)
      refs_for_replace = AdBannersArticle.joins(:ad_banner).where(
        article_id: article_type_ids,
        automaticly_created: true,
        ad_banners: { ad_position: ad_position }
      )
      refs_for_replace.each { |ref| ref.destroy }

      article_type_ids.each do |article_id|
        ad_banners_articles << AdBannersArticle.new(article_id: article_id, automaticly_created: true)
      end
    end
  end
end
