Rails.application.routes.draw do
  resources :user_ministries
  resources :announcements
  resources :events
  resources :ministries
  resources :memory_verses

  get 'users/show'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'users#show', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
