BoringScience::Engine.routes.draw do
  root to: 'articles#index'

  resources :articles, only: :index
end
