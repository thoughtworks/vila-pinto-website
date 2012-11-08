class Partner < ActiveRecord::Base
  attr_accessible :name, :url, :image
  mount_uploader :image, ImageUploader
  
  validates :name, :presence => true
  validates :image, :presence => true
  validates :url, :url => true, :allow_blank => true
end
