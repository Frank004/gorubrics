Rails.application.routes.draw do
  
  root to: 'visitors#index'
  devise_for :members
  authenticated do
    root 'event#index', :as => "eventos"
  end
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
