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
      t(project.visible.to_s)
    end
    column :updated_at
    default_actions
  end

  form :partial=> "indicators_form"

end
