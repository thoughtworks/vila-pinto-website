# -*- coding: UTF-8 -*-
class ProjectDecorator < Draper::Base
  decorates :project
  include Draper::LazyHelpers

  def available_indicators?
    available_spots? ||
    attendance_days? ||
    available_meals? ||
    attendance_goal? ||
    attendance_shift? ||
    frequency?
  end

  def frequency?
    show_frequency && !frequency_value.blank? && !frequency_value.zero? && !frequency_unit.blank?
  end

  def frequency
    [pluralize(frequency_value,"vez","vezes"),"por", t("frequency_unit.#{frequency_unit}").downcase].join(" ")
  end

  def attendance_shift?
    show_attendance_shift? && (attendance_shift_morning || attendance_shift_afternoon || attendance_shift_night)
  end

  def attendance_shifts
    available_shifts = []
    available_shifts << t("attendance_shifts.morning") if attendance_shift_morning
    available_shifts << t("attendance_shifts.afternoon") if attendance_shift_afternoon
    available_shifts << t("attendance_shifts.night") if attendance_shift_night
    available_shifts.join(", ")
  end

  def attendance_days
    @attendance_days ||= Date::DAYNAMES.collect do |day|
      t "attendance_days.#{day.downcase}" if send("attendance_day_#{day.downcase}")
    end.reject(&:nil?).join(", ")
  end

  def attendance_days?
    show_attendance_days && !attendance_days.blank?
  end

  def available_spots?
    show_available_spots && !available_spots.blank?
  end

  def available_spots_description
    pluralize(available_spots, "vaga disponibilizada", "vagas disponibilizadas")
  end

  def available_meals?
    show_meals_quantity && !meals_quantity_value.blank? && !meals_quantity_unit.blank?
  end

  def available_meals_title
    t("available_meals_title", :unit => t("meals_quantity_unit.#{meals_quantity_unit}")).html_safe
  end

  def attendance_goal?
    show_attendance_goal && !attendance_goal_value.blank?
  end
end
