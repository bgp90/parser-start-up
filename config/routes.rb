Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  # authenticated :user do
  #   root to:"user#dashboard"
  # end

  resources :angels

  resources :users, only: [:show] do
    get 'danger', on: :member
    get 'map', on: :member
  end



  # get 'dashboard/:id' => 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
