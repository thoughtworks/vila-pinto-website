ActiveAdmin.register FinancialReport do
  actions  :index, :destroy, :edit, :update, :new, :create
  config.clear_sidebar_sections! # remove filter sidebar
  config.paginate = false

  scope :cejak, :default => true
  scope :ctvp
  scope :vovo_belinha

  index :download_links => false do
    column :name
    column :type do |financial_report|
      translate_type(financial_report.type)
    end
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :type, :as => :select, :collection => financial_reports_type_options
      f.input :file, :for => :image, :as => :file, :hint => financial_report_file(f)
    end
    f.actions
  end
end
