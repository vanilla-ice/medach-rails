class BannerImageUploader < CommonUploader
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/article/ad_banners/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
