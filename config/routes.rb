Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'

  get    'auth'            => 'home#auth'

  # Get login token from Knock
  post   'user_token'      => 'user_token#create'


  devise_for :users
  get 'activity_logs/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :activity_logs, only: [:index]

  namespace :api, defaults: { format: :json } do
    #list of resources
    resources :activities
    resources :assistants
    resources :babies do
      resources :activity_logs
    end
    resources :activity_logs
  end

  root to: "home#index"

end
