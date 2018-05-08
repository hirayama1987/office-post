Rails.application.routes.draw do
  
  devise_for :users
  root to: 'pages#show_all'

  get 'pages/show_all'
  get 'pages/new'
  get 'pages/user/:username', to: 'pages#user'
  

  resources :statuses
  resources :questions
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
