class AddIndicatorsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :attendance_value, :integer
    add_column :projects, :show_attendance, :boolean

    add_column :projects, :attendance_days, :string
    add_column :projects, :show_attendance_days, :boolean

    add_column :projects, :frequency_value, :integer
    add_column :projects, :frequency_unit, :string
    add_column :projects, :show_frequency, :boolean

    add_column :projects, :attendance_shift, :string
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
