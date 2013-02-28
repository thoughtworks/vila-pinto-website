module ActiveAdmin::ProjectsHelper
  def project_category_options
    Project.categories.map do |category|
      [translate_category(category),category]
    end
  end

  def project_attendance_days_options
    Project.attendance_days.map do |day|
      [translate_attendance_day(day), day]
    end
  end

  def project_frequency_unit_options
    Project.frequency_units.map do |unit|
      [translate_frequency_unit(unit), unit]
    end
  end
end
