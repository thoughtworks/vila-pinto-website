VilaPintoWebsite::Application.routes.draw do

  resources :contacts, :only => [:new, :create]

  root :to => 'welcome#index'

  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
end
