class ImageUploader < CommonUploader
  include CarrierWave::MiniMagick
  # process scale: [278, 261]
  
  version :thumb do
    process resize_to_fill: [278,261]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
