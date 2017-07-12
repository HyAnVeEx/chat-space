class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  process resize_to_limit: [300, 200]
  version :thumb do
    process :resize_to_fit => [200, 200]
  end
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end
end
