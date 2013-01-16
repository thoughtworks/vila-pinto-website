# encoding: utf-8

class FileUploader < CarrierWave::Uploader::GoogleDrive

  google_login ENV['GOOGLE_DRIVE_USER']
  google_password ENV['GOOGLE_DRIVE_PASSWORD']

end
