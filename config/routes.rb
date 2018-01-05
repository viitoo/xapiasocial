Rails.application.routes.draw do
  resources :friendships
  resources :posts
  devise_for :users
  get 'home/index'
  get 'home/comunidad'
  get 'home/perfil'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
