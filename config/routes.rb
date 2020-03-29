BoringScience::Engine.routes.draw do
  root to: 'articles#index'

  resources :articles, param: :slug, path: '/'
end
