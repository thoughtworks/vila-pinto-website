class AddIndicatorsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :attendance_value, :integer
    add_column :projects, :show_attendance, :boolean

    add_column :projects, :attendance_day_sunday, :boolean
    add_column :projects, :attendance_day_monday, :boolean
    add_column :projects, :attendance_day_tuesday, :boolean
    add_column :projects, :attendance_day_wednesday, :boolean
    add_column :projects, :attendance_day_thursday, :boolean
    add_column :projects, :attendance_day_friday, :boolean
    add_column :projects, :attendance_day_saturday, :boolean
    add_column :projects, :show_attendance_days, :boolean

    add_column :projects, :frequency_value, :integer
    add_column :projects, :frequency_unit, :string
    add_column :projects, :show_frequency, :boolean

    add_column :projects, :attendance_shift_morning, :boolean
    add_column :projects, :attendance_shift_afternoon, :boolean
    add_column :projects, :attendance_shift_night, :boolean
    add_column :projects, :show_attendance_shift, :boolean

    add_column :projects, :attendance_goal_value, :integer
    add_column :projects, :show_attendance_goal, :boolean

    add_column :projects, :meals_quantity_value, :integer
    add_column :projects, :meals_quantity_unit, :string
    add_column :projects, :show_meals_quantity, :boolean

    add_column :projects, :available_spots, :integer
    add_column :projects, :show_available_spots, :boolean
  end
end
