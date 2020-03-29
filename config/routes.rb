BoringScience::Engine.routes.draw do
  root to: 'articles#index'

  resources :articles, except: :destroy
end
