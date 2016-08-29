Rails.application.routes.draw do
  devise_for :users

  root 'users#show'
  get 'about' => 'welcome#about'

  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy]
  end
end
