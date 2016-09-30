Rails.application.routes.draw do
  
get '/showroom', to: 'showrooms#show1'

   mount Ckeditor::Engine => '/ckeditor'
 
  root to: "posts#index"

  resources :posts do
  	resources :comments
  	resources :visitors
  end
  resources :tags, only: [:index, :show]
  
  


end
