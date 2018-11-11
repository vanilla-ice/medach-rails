class ImageUploader < CommonUploader
  include CarrierWave::MiniMagick
  # process scale: [278, 261]
  # process resize_to_fit: [800, 800]

  # version :thumb do
  #   process resize_to_fill: [278,261]
  # end

  def store_dir
    if model.class.to_s.in?(Article::TYPES)
      return "uploads/article/#{mounted_as}/#{model.id}"
    end
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
