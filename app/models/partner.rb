class Partner < ActiveRecord::Base
  self.inheritance_column = '' # sets to nil to be possible use type as a common column
  values_for :type, :has => [:cea, :cejak, :ctvp, :vovo_belinha], :add => [:predicate_methods, :constants]

  attr_accessible :name, :url, :image, :type
  mount_uploader :image, ImageUploader
  
  validates :name, :presence => true, :length => { :maximum => 200 }
  validates :image, :presence => true
  validates :url, :url => true, :allow_blank => true, :length => { :maximum => 200 }
  
  scope :vovo_belinha, where(:type => Partner::TYPE_VOVO_BELINHA)
  scope :ctvp, where(:type => Partner::TYPE_CTVP)
  scope :cea, where(:type => Partner::TYPE_CEA)
  scope :cejak, where(:type => Partner::TYPE_CEJAK)
end
