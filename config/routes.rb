Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]

  resource :session, only: [:create]

  #TODO User Friendly Url's
  get 'login'     => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  get 'register'  => 'users#new'

  resources :posts do
    resources :comments
  end

  #TODO defino el root_path
  root to: 'posts#index'
end
