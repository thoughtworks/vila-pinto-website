class ChangeAttendanceGoalFromProject < ActiveRecord::Migration
  def change
    change_column :projects, :attendance_goal_value, :string
    remove_column :projects, :attendance_value
    remove_column :projects, :show_attendance
  end

end
