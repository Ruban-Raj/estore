Rails.application.routes.draw do
  resources :users do
    collection do
      get "sign_in"
      post "users/auth_login"
      delete "logout"
  end
  end

  root 'products#index'
  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
