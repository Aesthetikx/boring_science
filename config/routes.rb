BoringScience::Engine.routes.draw do
  root to: 'articles#index'

  resources :articles, only: %i[index show new create]
end
