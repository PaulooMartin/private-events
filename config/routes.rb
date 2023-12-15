Rails.application.routes.draw do
  root to: "events#index"
  resources :events
  devise_for :users
  get 'users/:username', to:'users#show', as: 'user'
  post 'invitation', to: 'invitation#create', as: 'invitation'
  delete 'invitation', to: 'invitation#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end
