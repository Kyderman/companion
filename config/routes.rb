Companion::Application.routes.draw do
  resources :teams_users

  resources :fixtures

  resources :teams_competitions

  resources :competitions

  resources :team_rosters

  resources :teams
  
  
  
  
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  
  
  
  authenticated do
  root :to => 'home#dashboard', as: :authenticated
end

root :to => 'home#index'
end