Rails.application.routes.draw do
  
get '/admineditposts', to: 'posts#admin_index'

   mount Ckeditor::Engine => '/ckeditor'
 
  root to: "posts#index"

  resources :posts do
  	resources :comments
  	resources :visitors
  end
  resources :tags, only: [:index, :show]
  
  


end
