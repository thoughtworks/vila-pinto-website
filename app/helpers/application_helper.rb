module ApplicationHelper
  def translate_type type
    I18n.t "type.#{type}" 
  end

  def translate_category category
    I18n.t "category.#{category}" 
  end

  def translate_attendance_day day
    I18n.t "attendance_days.#{day}"
  end

  def translate_frequency_unit unit
    I18n.t "frequency_unit.#{unit}"
  end

  def translate_attendance_shift shift
    I18n.t "attendance_shifts.#{shift}"
  end

  def translate_meals_unit unit
    I18n.t "meals_quantity_unit.#{unit}"
  end

end
