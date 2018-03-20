class SiteConfig < ApplicationRecord
  def data_value(key)
    data ? data[key] || [] : []
  end
end
