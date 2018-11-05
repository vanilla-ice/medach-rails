class AvatarUploader < CommonUploader
  include CarrierWave::MiniMagick

  process resize_to_fit: [200, nil]
  process resize_and_crop: 200

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  private

  def resize_and_crop(size)
    manipulate! do |image|
      if image[:width] < image[:height]
        remove = ((image[:height] - image[:width])/2).round
        image.shave("0x#{remove}")
      elsif image[:width] > image[:height]
        remove = ((image[:width] - image[:height])/2).round
        image.shave("#{remove}x0")
      end
      image.resize("#{size}x#{size}")
      image
    end
  end

end
