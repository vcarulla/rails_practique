Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :auth do
    resources :users, only: [:create]
    resource  :session, only: [:create]
    resource  :confirmation
  end

  #TODO User Friendly Url's
  get 'login'     => 'auth/sessions#new'
  delete 'logout' => 'auth/sessions#destroy'
  get 'register'  => 'auth/users#new'

  resources :posts do
    resources :comments
  end

  #TODO defino el root_path
  root to: 'posts#index'
end
