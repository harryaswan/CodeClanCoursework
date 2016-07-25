Rails.application.routes.draw do

    devise_for :users
    root "accounts#index"

    resources :accounts, defaults: {format: :json}

end
