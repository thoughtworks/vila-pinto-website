ActiveAdmin.register Project do
  actions  :index, :destroy, :edit, :update, :new, :create
  config.clear_sidebar_sections! # remove filter sidebar
  config.paginate = false

  scope :children_and_teenagers, :default => true
  scope :community

  index :download_links => false do
    column :name
    column :category do |project|
      translate_category(project.category)
    end
    column :visible do |project|
      t(project.visible)
    end
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :category, :as => :select, :collection => project_category_options
      f.input :visible
      f.input :description
    end

    f.inputs do
      f.input :attendance_value
      f.input :show_attendance
      f.input :attendance_days, :as => :check_boxes, :collection => project_attendance_days_options
      f.input :show_attendance_days
      f.input :frequency_value
      f.input :frequency_unit, :as => :select, :collection => project_frequency_unit_options
      f.input :show_frequency
      f.input :attendance_shift, :as => :check_boxes, :collection => project_attendace_shift_options
      f.input :show_attendance_shift
      f.input :attendance_goal_value
      f.input :show_attendance_goal
      f.input :meals_quantity_value
      f.input :meals_quantity_unit, :as => :select, :collection => project_meals_options
      f.input :show_meals_quantity
      f.input :available_spots
      f.input :show_available_spots
    end

    f.actions
  end
end
