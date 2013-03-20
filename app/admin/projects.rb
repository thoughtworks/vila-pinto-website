ActiveAdmin.register Project do
  actions  :index, :destroy, :edit, :update, :new, :create
  config.clear_sidebar_sections! # remove filter sidebar
  config.paginate = false

  puts form

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

  form :partial=> "indicators_form"
=begin
  form do |f|
    f.inputs do
      f.input :name
      f.input :category, :as => :select, :collection => project_category_options
      f.input :visible
      f.input :description
    end

    f.inputs do
      f.input :attendance_value, :input_html => { :class => 'short_value'  }, :wrapper_html => { :class => 'project_indicator_label_value_column' }
      f.input :show_attendance, :label=>'',  :wrapper_html => { :class => 'indicator_show_column', :style => 'display:block;float:right; width:10%;  '   }
      f.input :attendance_day_monday 
      f.input :attendance_day_tuesday
      f.input :attendance_day_wednesday
      f.input :attendance_day_thursday
      f.input :attendance_day_friday
      f.input :attendance_day_saturday
      f.input :attendance_day_sunday
      f.input :show_attendance_days
      f.input :frequency_value
      f.input :frequency_unit, :as => :select, :collection => project_frequency_unit_options
      f.input :show_frequency
      f.input :attendance_shift_morning
      f.input :attendance_shift_afternoon
      f.input :attendance_shift_night
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
=end
end
