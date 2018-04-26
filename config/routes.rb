Rails.application.routes.draw do
  
  devise_for :users
  root to: 'pages#show_all'

  get 'pages/show_all'
  get 'pages/new'

  resources :statuses
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end