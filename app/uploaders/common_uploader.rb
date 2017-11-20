class CommonUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
end
