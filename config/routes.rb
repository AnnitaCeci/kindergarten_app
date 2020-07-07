Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  get 'activity_logs/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :activity_logs, only: [:index]

  namespace :api, defaults: { format: :json } do
    #list of resources
    resources :activities
    resources :babies do
      resources :activity_logs, only: [:index]
    end
    resources :activity_logs
  end

  root to: "home#index"

end
