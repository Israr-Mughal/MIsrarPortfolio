Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  resources :portfolios 
 
  get 'about-me' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'anguler-items' => 'portfolios#anguler'

  resources :blogs do 
  	member do
  		get :toggle_status
  	end
  end	
  root to: 'pages#home'
end
