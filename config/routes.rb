Rails.application.routes.draw do
  
get '/admineditposts', to: 'posts#admin_index'
get 'p/:slug', slug: /[a-z-]+\w+/i, to: 'posts#show', as: :post
   mount Ckeditor::Engine => '/ckeditor'
 
  root to: "posts#index"

  resources :posts do
  	resources :comments
  	resources :visitors
  end
  resources :tags, only: [:index, :show]
  
  


end
