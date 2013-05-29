class ProjectPicture < ActiveRecord::Base
  belongs_to :project

  attr_accessible :image
  mount_uploader :image, FileUploader

  validates :image, :presence => true
end
