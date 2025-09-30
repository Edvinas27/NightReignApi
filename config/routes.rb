Rails.application.routes.draw do
  namespace :api do
    namespace :admin do
      post 'auth', to: 'auth#create'
    end
    namespace :v1 do
      resources :weapons
    end
  end
  match '*unmatched', to: 'application#handle_route_not_found', via: :all

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
