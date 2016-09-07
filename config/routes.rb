Rails.application.routes.draw do
  get 'welcome/index'
  get 'about' => 'welcome#about'

  root 'users#show'
  resources :items, only: [:create]

  devise_for :users
end
