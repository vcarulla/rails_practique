Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resource :session

  resources :posts do
    resources :comments
  end

  #TODO defino el root_path
  root to: 'posts#index'
end
