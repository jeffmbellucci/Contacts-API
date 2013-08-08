Contacts::Application.routes.draw do

  resources :users do
    resources :favorites
    resources :contacts
  end
end