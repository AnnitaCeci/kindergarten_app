Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :activity_logs, only: [:index]

  namespace :api, defaults: { format: :json } do
    #list of resources
    resources :activities
    resources :babies do
      resources :activity_logs, only: [:index]
    end
  end
end
