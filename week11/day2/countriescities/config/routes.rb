Rails.application.routes.draw do


    resources :continents do
        resources :countries do
            resources :cities
        end
    end
    
    resources :countries do
        resources :cities
    end

    resources :cities

end
