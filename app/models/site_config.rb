class SiteConfig < ApplicationRecord
  scope :active, -> { where(active: true).order("created_at DESC") }

  def data_value(key)
    data ? data[key] || [] : []
  end
end
