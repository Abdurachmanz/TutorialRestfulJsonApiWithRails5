Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  
  resources :lukisans
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :citrakaras do
    resources :items
  end
end
