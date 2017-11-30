class CommonUploader < CarrierWave::Uploader::Base
  storage :fog
  # if Rails.env.production?
  # else
  #   storage :file
  # end
end
