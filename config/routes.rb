VilaPintoWebsite::Application.routes.draw do

  resources :contacts, :only => [:new, :create]

  root :to => 'welcome#index'

  match '/cejak' => 'welcome#cejak', as: :cejak
  match '/ctvp' => 'welcome#ctvp', as: :ctvp
  match '/vovo' => 'welcome#vovo', as: :vovo

  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
end
