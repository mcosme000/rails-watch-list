Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'lists#index'
  resources :lists, except: :index do
    resources :bookmarks, only: %i[new create]
    collection do
      get :top_rated
    end
  end
end
