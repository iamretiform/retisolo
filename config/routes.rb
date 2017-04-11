Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :locations, params: :slug
  resources :sounds
  mount ActionCable.server => '/cable'
end
