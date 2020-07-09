Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'home/index'

   devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :activity_logs, only: [:index,:show]

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
