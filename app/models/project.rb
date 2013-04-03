class Project < ActiveRecord::Base
  attr_accessible :category, :description, :name, :visible, :url
  attr_accessible :attendance_value, :show_attendance
  attr_accessible :attendance_day_sunday, :attendance_day_monday,:attendance_day_tuesday,:attendance_day_wednesday,:attendance_day_thursday
  attr_accessible :attendance_day_friday, :attendance_day_saturday
  attr_accessible :show_attendance_days
  attr_accessible :frequency_value, :frequency_unit, :show_frequency
  attr_accessible :attendance_shift_morning, :attendance_shift_afternoon, :attendance_shift_night 
  attr_accessible :show_attendance_shift
  attr_accessible :attendance_goal_value, :show_attendance_goal
  attr_accessible :meals_quantity_value, :meals_quantity_unit, :show_meals_quantity
  attr_accessible :available_spots, :show_available_spots

  values_for :category, :has => [:children_and_teenagers, :community], :add => [:predicate_methods, :constants]
  #values_for :attendance_days, :has => [ :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday], :add => [:predicate_methods, :constants]
  values_for :frequency_unit, :has => [:week, :month], :add => [:predicate_methods, :constants]
  #values_for :attendance_shift, :has => [:morning, :afternoon, :night], :add => [:predicate_methods, :constants]
  values_for :meals_quantity_unit, :has => [:day, :month], :add => [:predicate_methods, :constants]

  validates :name, :presence => true, :length => { :maximum => 200 }
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :url, :presence => true, :length => { :maximum => 200 }
  validates :attendance_value, :numericality => { :greater_than => 0, :less_than => 100000 }
  validates :frequency_value, :numericality => { :greater_than => 0, :less_than => 100 }
  validates :attendance_goal_value, :numericality => { :greater_than => 0, :less_than => 100000 }
  validates :meals_quantity_value, :numericality => { :greater_than => 0, :less_than => 100000 }
  validates :available_spots, :numericality => { :greater_than => 0, :less_than => 10000 }
  validates_format_of :url, :with => /^([a-z0-9_]*)$/

  scope :children_and_teenagers, where(:category => Project::CATEGORY_CHILDREN_AND_TEENAGERS)
  scope :community, where(:category => Project::CATEGORY_COMMUNITY)

end
