class Project < ActiveRecord::Base

  

  attr_accessible :category, :description, :name, :visible
  attr_accessible :attendance_value, :show_attendance
  attr_accessible :attendance_day_sunday, :attendance_day_monday,:attendance_day_tuesday,:attendance_day_wednesday,:attendance_day_thursday
  attr_accessible :attendance_day_friday, :attendance_day_saturday
  attr_accessible :show_attendance_days
  attr_accessible :frequency_value, :frequency_unit, :show_frequency
  attr_accessible :attendance_shift_morning, :attendance_shift_afternoon, :attendance_shift_night , :show_attendance_shift
  attr_accessible :attendance_goal_value, :show_attendance_goal
  attr_accessible :meals_quantity_value, :meals_quantity_unit, :show_meals_quantity
  attr_accessible :available_spots, :show_available_spots

  values_for :category, :has => [:children_and_teenagers, :community], :add => [:predicate_methods, :constants]
  values_for :frequency_unit, :has => [:week, :month], :add => [:predicate_methods, :constants], :allow_nil => true
  values_for :meals_quantity_unit, :has => [:day, :month], :add => [:predicate_methods, :constants], :allow_nil => true

  validates :name, :presence => true, :length => { :maximum => 200 }
  validates :description, :presence => true, :length => { :maximum => 500 }
  #indicators
  validates :attendance_value, :numericality => { :greater_than => 0, :less_than => 100000 }, :allow_nil => true
  validates :frequency_value, :numericality => { :greater_than => 0, :less_than => 100 }, :allow_nil => true
  validates :attendance_goal_value, :numericality => { :greater_than => 0, :less_than => 100000 }, :allow_nil => true
  validates :meals_quantity_value, :numericality => { :greater_than => 0, :less_than => 100000 }, :allow_nil => true
  validates :available_spots, :numericality => { :greater_than => 0, :less_than => 10000 }, :allow_nil => true

  validate :invalid_frequency

  #validates :frequency_unit, :allow_nil => true
  #validates :meals_quantity_unit, :allow_nil => true

  scope :children_and_teenagers, where(:category => Project::CATEGORY_CHILDREN_AND_TEENAGERS)
  scope :community, where(:category => Project::CATEGORY_COMMUNITY)

  def error_message(message)
    I18n.t("activerecord.attributes.project.errors.#{message}")
  end  
  

  def invalid_frequency
    
    errors.add(:frequency_unit, error_message(:frequency_without_unit) )  if not frequency_value.nil? and  frequency_unit.nil? 
    errors.add(:frequency_value, error_message(:frequency_without_value) )  if not frequency_unit.nil? and frequency_value.nil? 
    errors.add(:show_frequency, error_message(:show_without_frequency) )  if show_frequency and frequency_value.nil? 
    
  end


end


