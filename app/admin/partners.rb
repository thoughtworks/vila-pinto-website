ActiveAdmin.register Partner do
  actions  :index, :destroy, :edit, :update, :new, :create
  
  filter :name
  filter :url
  filter :updated_at
   
  index :download_links => false do
    column :name
    column :url
    column :updated_at
    default_actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :image, :for => :image, :as => :file, :hint => f.object.image.file.filename
      f.input :url
      
    end
    f.actions
  end
end
