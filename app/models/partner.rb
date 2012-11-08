class Partner < ActiveRecord::Base
  set_inheritance_column '' # sets to nil to be possible use type as a common column
  values_for :type, :has => [:cea, :cejak, :ctvp, :vovo_belinha], :add => [:predicate_methods, :constants]

  attr_accessible :name, :url, :image, :type
  mount_uploader :image, ImageUploader
  
  validates :name, :presence => true
  validates :image, :presence => true
  validates :url, :url => true, :allow_blank => true
end
