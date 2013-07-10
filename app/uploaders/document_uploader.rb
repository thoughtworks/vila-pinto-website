# encoding: utf-8
class DocumentUploader < CarrierWave::Uploader::GoogleDrive

  google_login ENV['GOOGLE_DRIVE_USER']
  google_password ENV['GOOGLE_DRIVE_PASSWORD']

  def extension_white_list
    %w(pdf)
  end

end