# encoding: utf-8

class FileUploader < CarrierWave::Uploader::GoogleDrive
    include CarrierWave::RMagick

  process :resize_to_limit => [500, 500]

  version :thumb do
    process :resize_to_fill => [200,200]
  end

  google_login ENV['GOOGLE_DRIVE_USER']
  google_password ENV['GOOGLE_DRIVE_PASSWORD']

  def extension_white_list
    %w(jpg jpeg gif png pdf)
  end
end
