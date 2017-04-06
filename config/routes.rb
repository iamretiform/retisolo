Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :locations, param: :slug
  resources :sounds
  mount ActionCable.server => '/cable'
end
