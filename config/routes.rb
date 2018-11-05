Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      post 'authenticate', to: 'authentication#authenticate'
      get '/auth0Authenticate', to: 'authentication#auth0Authenticate'
      post 'register', to: 'authentication#register'
      get '/findUser/:email', to:'users#findUser', constraints: { email: /[^\/]+/}

      resources :tasks, only: [:index, :create, :destroy, :update]
      get 'tasks/artist/:artist_id', :controller => 'tasks', :action => 'customIndex'

      post '/docusign', to: 'docusign#create'

      resources :groups, only: [:index, :create, :destroy, :update, :show]
      resources :companies, only: [:index, :create, :destroy, :update, :show]
      resources :artists, only: [:index, :create, :destroy, :update, :show]


    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
