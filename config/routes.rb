Rails.application.routes.draw do
  root 'users#show'


  get 'welcome/index'
  get 'about' => 'welcome#about'

  devise_for :users
end
