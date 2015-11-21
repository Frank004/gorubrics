Rails.application.routes.draw do
  
  root to: 'visitors#index'
  devise_for :members

  resources :organizations, shallow: true do
    resources :categories, :except => [:show]
    resources :events, shallow: true do
      resources :participants
      resources :characters
      resources :sponsors
      resources :scores
      resources :promos
      resources :evaluations
      resources :evaluation_builders
      resources :criterions
    end
  end
end
