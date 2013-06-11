class FinancialReport < ActiveRecord::Base
  self.inheritance_column = '' # sets to nil to be possible use type as a common column
  values_for :type, :has => [:cejak, :ctvp, :vovo_belinha, :cea], :add => [:predicate_methods, :constants]

  attr_accessible :file, :name, :type
  mount_uploader :file, FileUploader

  validates :name, :presence => true, :length => { :maximum => 200 }
  validates :file, :presence => true
  validates :type, :presence => true

  scope :vovo_belinha, where(:type => FinancialReport::TYPE_VOVO_BELINHA)
  scope :ctvp, where(:type => FinancialReport::TYPE_CTVP)
  scope :cejak, where(:type => FinancialReport::TYPE_CEJAK)
  scope :cea, where(:type => FinancialReport::TYPE_CEA)
end
