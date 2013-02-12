class Project < ActiveRecord::Base
  attr_accessible :category, :description, :name, :visible

  values_for :category, :has => [:children_and_teenagers, :community], :add => [:predicate_methods, :constants]

  validates :name, :presence => true, :length => { :maximum => 200 }
  validates :description, :presence => true, :length => { :maximum => 500 }

  scope :children_and_teenagers, where(:category => Project::CATEGORY_CHILDREN_AND_TEENAGERS)
  scope :community, where(:category => Project::CATEGORY_COMMUNITY)
end
