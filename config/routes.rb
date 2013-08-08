Contacts::Application.routes.draw do
  resource :sessions, :only => [:create, :destroy]
  resources :users do
    resources :favorites, :except => [:show, :update]
    resources :contacts
  end
end