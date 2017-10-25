Rails.application.routes.draw do
  resources :user_ministries
  resources :announcements
  resources :events
  resources :ministries
  resources :memory_verses
  devise_for :users
  resources :users
  get 'static_pages/home'

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
