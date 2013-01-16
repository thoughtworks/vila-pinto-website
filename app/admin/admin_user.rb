ActiveAdmin.register AdminUser do
  actions  :index, :destroy, :edit, :update, :new, :create
  config.clear_sidebar_sections! # remove filter sidebar
  config.paginate = false

  index :download_links => false do
    column :email
    column :updated_at

    default_actions
  end

  #filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
