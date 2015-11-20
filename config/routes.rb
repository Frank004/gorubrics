Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :members
end
