Rails.application.routes.draw do
  # get "fruits" => "fruits#index"
  # get "fruits/:id" => "fruits#show"
  resources :fruits
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
