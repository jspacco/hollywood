Rails.application.routes.draw do

  root 'actors#index'
  
  #resource :actors, only: [:index, :show, :create, :new]
  resources :actors
end
