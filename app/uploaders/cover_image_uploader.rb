class CoverImageUploader < CommonUploader
  include CarrierWave::MiniMagick
  # process scale: [278, 261]
  process resize_to_fit: [600, 600]

  def store_dir
    if model.class.to_s.in?(Article::TYPES)
      return "uploads/article/cover_image/#{model.id}"
    end
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
