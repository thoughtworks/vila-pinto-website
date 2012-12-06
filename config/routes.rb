VilaPintoWebsite::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :contacts, :only => [:new, :create]

  root :to => 'welcome#index'

  match '/donation' => 'donation#index', as: :donation

  match '/transparency' => 'transparency#index', as: :transparency

  match '/cejak' => 'cejak#index', as: :cejak
  match '/ctvp' => 'ctvp#index', as: :ctvp
  match '/vovo' => 'vovo#index', as: :vovo

  match '/ctvp/materiais' => 'ctvp#materiais', as: :ctvp_materiais
  match '/ctvp/sponsors' => 'ctvp#sponsors', as: :ctvp_sponsors

  match '/vovo/sponsors' => 'vovo#sponsors', as: :vovo_sponsors
  match '/vovo/donation' => 'vovo#donation', as: :vovo_donation

  match '/cejak/projects' => 'cejak#projects', as: :cejak_projects

  match '/cejak/projects/:project_name' => 'cejak#show', as: :cejak_project

  #ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
end
