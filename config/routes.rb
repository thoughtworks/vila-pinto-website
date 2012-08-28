VilaPintoWebsite::Application.routes.draw do

  resources :contacts, :only => [:new, :create]

  root :to => 'welcome#index'

  match '/cejak' => 'departments#cejak', as: :cejak
  match '/ctvp' => 'departments#ctvp', as: :ctvp
  match '/vovo' => 'departments#vovo', as: :vovo

  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
end
