class Article < ApplicationRecord
  include PgSearch
  include Sortable

  TYPES = %w(BlogArticle LongreadArticle MediaArticle NewsArticle CaseArticle).freeze

  is_impressionable :counter_cache => true, :unique => :all

  validates :short_description, length: { maximum: 250 }
  validates :title, :tag_string, presence: true

  belongs_to :user, optional: true
  belongs_to :updater, class_name: 'User', optional: true
  has_many :images
  has_many :article_typos
  has_many :banners
  accepts_nested_attributes_for :banners

  before_save :delete_whitespace

  acts_as_ordered_taggable
  mount_uploader :cover_image, CoverImageUploader
  mount_uploader :avatar, AvatarUploader
  mount_uploader :small_cover_image, SmallCoverImageUploader
  mount_uploader :slider_image, ImageUploader

  scope :fixed, -> { where(fixed: true) }
  scope :published, -> { where('publish_on < ?', Time.current) }
  scope :newest_first, -> { order(created_at: :desc) }

  multisearchable against: [:title, :author, :short_description, :origin]
  pg_search_scope :search,
    against: [:title, :author, :short_description, :origin],
    associated_against: { :tags => [:name] },
    using: {
      tsearch: { dictionary: 'russian', prefix: true }
    }

  def delete_whitespace
    self.tag_list = self.tag_list.map {|s| s.gsub(/(\#|\s)/, '')}
    self
  end

  def self.article_types
    %w(LongreadArticle BlogArticle NewsArticle)
  end

  def tag_string=(value)
    self.tag_list = value
  end

  def tag_string
    self.tag_list.join(', ')
  end

  private

  def self.filter(filtering_params)
    results = self.where(nil)
    filtering_params.each do |key, value|
      case key
      when 'tag' then results = results.tagged_with(value)
      when 'query' then results = search(value)
      else results = results.where(key => value) if value.present?
      end
    end
    results
  end

end
