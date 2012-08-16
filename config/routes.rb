VilaPintoWebsite::Application.routes.draw do

  resources :contacts, :path => "contato", :only => [:new, :create]

  root :to => 'welcome#index'
end
