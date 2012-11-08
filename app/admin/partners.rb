include ActiveAdmin::PartnersHelper
ActiveAdmin.register Partner do
  actions  :index, :destroy, :edit, :update, :new, :create
  
  filter :name
  filter :url
  filter :updated_at
   
  index :download_links => false do
    column :name
    column :type do |partner|
      translate_type(partner.type)
    end
    column :url
    column :updated_at
    default_actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :type, :as => :select, :collection => type_options
      f.input :image, :for => :image, :as => :file, :hint => image_info(f)
      f.input :url
    end
    f.actions
  end
end
