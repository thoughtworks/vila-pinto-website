# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::GoogleDrive

  google_login ENV['GOOGLE_DRIVE_USER']
  google_password ENV['GOOGLE_DRIVE_PASSWORD']

end
