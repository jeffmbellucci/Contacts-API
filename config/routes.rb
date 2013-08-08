Contacts::Application.routes.draw do

  resources :users do
    resources :favorites, :except => [:show, :update]
    resources :contacts
  end
end