Rails.application.routes.draw do
  get 'dynamic_pages/welcome'
  get 'index', to: 'static_pages#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  

  #get 'cities/show', to: 'cities#show'
  #get 'users/show', to: 'users#show'
#  get 'city/show', to: 'cities#show'


  resources :cities 
  resources :users

  resources :gossips do
    resources :comments
  end

  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
