Rails.application.routes.draw do

get '/about', to: 'pages#about'  
get '/services', to: 'pages#service'  
get '/contact', to: 'pages#contact' 
get '/support', to: 'pages#support' 
get '/admineditposts', to: 'posts#admin_index'

   mount Ckeditor::Engine => '/ckeditor'
 
  root to: "posts#index"

  resources :posts do
  	resources :comments
  	resources :visitors
  end
  resources :tags, only: [:index, :show]
  
  


end
