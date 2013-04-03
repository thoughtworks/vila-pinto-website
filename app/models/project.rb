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

  validate :invalid_attendance, :invalid_attendance_days, :invalid_frequency, :invalid_shift, 
      :invalid_attendance_goal, :invalid_meals_quantity, :invalid_spots

  
  scope :children_and_teenagers, where(:category => Project::CATEGORY_CHILDREN_AND_TEENAGERS)
  scope :community, where(:category => Project::CATEGORY_COMMUNITY)

  def error_message(message)
    I18n.t("activerecord.attributes.project.errors.#{message}")
  end  

  def invalid_attendance
    errors.add(:show_attendance, error_message(:show_without_attendance) )  if show_attendance and attendance_value.nil? 
  end

  def invalid_attendance_days
     selected_days = [ 
        attendance_day_sunday, attendance_day_monday, attendance_day_tuesday, attendance_day_wednesday,
        attendance_day_thursday, attendance_day_friday, attendance_day_saturday
      ]

      errors.add(:show_attendance_days, error_message(:show_without_attendance_days) )  if show_attendance_days and not selected_days.any?     
    
  end 
  

  def invalid_frequency
    
    errors.add(:frequency_unit, error_message(:frequency_without_unit) )  if not frequency_value.nil? and  frequency_unit.nil? 
    errors.add(:frequency_value, error_message(:frequency_without_value) )  if not frequency_unit.nil? and frequency_value.nil? 
    errors.add(:show_frequency, error_message(:show_without_frequency) )  if show_frequency and frequency_value.nil? 
    
  end

  def invalid_shift
    selected_shifts = [ attendance_shift_morning, attendance_shift_afternoon, attendance_shift_night ]
    errors.add(:show_attendance_shift, error_message(:show_without_shift) )  if show_attendance_shift and not selected_shifts.any?     
  end

  def invalid_attendance_goal
    errors.add(:show_attendance_goal, error_message(:show_without_attendance_goal) )  if show_attendance_goal and attendance_goal_value.nil? 
  end

  def invalid_meals_quantity
    
    errors.add(:meals_quantity_unit, error_message(:meals_without_unit) )  if not meals_quantity_value.nil? and  meals_quantity_unit.nil? 
    errors.add(:meals_quantity_value, error_message(:meals_without_value) )  if not meals_quantity_unit.nil? and meals_quantity_value.nil? 
    errors.add(:show_meals_quantity, error_message(:show_without_meals) )  if show_meals_quantity and meals_quantity_value.nil? 
    
  end

  def invalid_spots
    errors.add(:show_available_spots, error_message(:show_without_spots) )  if show_available_spots and available_spots.nil? 
  end


end


