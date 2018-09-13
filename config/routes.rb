Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      post 'authenticate', to: 'authentication#authenticate'

      resources :tasks, only: [:index, :create, :destroy, :update]
      get 'tasks/artist/:artist_id', :controller => 'tasks', :action => 'customIndex'

      resources :artists, only: [:index, :create, :destroy, :update, :show]


    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
